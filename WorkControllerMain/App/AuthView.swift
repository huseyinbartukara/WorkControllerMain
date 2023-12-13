//
//  AuthView.swift
//  WorkControllerMain
//
//  Created by Bartu Kara on 12.12.2023.
//

import SwiftUI

struct AuthView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var sicilNo = ""
    
    @State private var isSigningUp = false
    @EnvironmentObject private var authService : AuthService
    
    
    var body: some View {
        ZStack{
            AppBackground()
            VStack(spacing: 30){
                Spacer()
                
                Text("\(isSigningUp ? "Kayıt Ol" : "Giriş Yap")")
                    .font(.system(size: 50))
                    .foregroundStyle(.accentAcik)
                
                
                
                VStack(spacing: 20){
                    if isSigningUp{
                        TextField("Ad:", text: $name)
                            .textFieldStyle(.roundedBorder)
                        TextField("Sicil No", text: $sicilNo)
                            .textFieldStyle(.roundedBorder)
                    }
                    TextField("Email:", text: $email)
                        .textFieldStyle(.roundedBorder)
                    SecureField("Şifre:", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                
                
                Button(action: {
                    authenticate()
                    
                }, label: {
                    
                    ZStack{
                        Rectangle()
                            .frame(width: 200, height: 50)
                            .cornerRadius(20)
                            .foregroundStyle(.accentAcik)
                        Text("\(isSigningUp ? "Kayıt Ol" : "Giriş Yap")")
                            .font(.system(size: 25))
                            .foregroundStyle(.appBackground)
                        
                    }
                    
                    
                    
                })
                
                
                
                Button("\(isSigningUp ? "Zaten Bir Hesabım Var" : "Hayır Bir Hesabım Yok" )") {
                    isSigningUp.toggle()
                }
                .foregroundStyle(.accentAcik)
                
                Spacer()
            }
            .padding()
        }
    }
    
    func authenticate(){
        Task {
            do{
                if isSigningUp{
                    try await authService.signUp(email, password: password, name: name, sicilNo: sicilNo)
                }else{
                    try await authService.login(email: email, password: password)
                }
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    
}

#Preview {
    AuthView()
}
