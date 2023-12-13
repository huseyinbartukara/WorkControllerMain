//
//  SettingsView.swift
//  WorkControllerMain
//
//  Created by Bartu Kara on 12.12.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject private var authService : AuthService
    
    var body: some View {
        VStack{
            Button(action: {
                logOut()
            }, label: {
                Text("Çıkış Yap")
            })
        }
    }
    
    func logOut() {
        do{
            try authService.logOut()
        }catch{
            print(error.localizedDescription)
        }
    }
    
}

#Preview {
    SettingsView()
}
