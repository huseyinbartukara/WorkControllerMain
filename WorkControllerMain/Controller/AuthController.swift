//
//  MainView.swift
//  WorkControllerMain
//
//  Created by Bartu Kara on 12.12.2023.
//

import SwiftUI

struct AuthController: View {
    
    @EnvironmentObject private var authService : AuthService
    
    var body: some View {
        Group{
            switch authService.authState {
            case .undefined:
                    ProgressView()
            case .notAuthenticated:
                AuthView()
            case .authenticated:
                MenuView()
            }
        }
    }
}

#Preview {
    AuthController()
}
