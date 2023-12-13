//
//  NavigationStackManager.swift
//  WorkControllerMain
//
//  Created by Bartu Kara on 12.12.2023.
//

import SwiftUI

enum Routes {
    case info
    case bordro
    case qrMaker
    case qrScanner
    case settings
}

struct NavigationStackController: View {
    
    // MARK: - Properties
    
    @State private var navPaths = [Routes]()
    
    // MARK: - Body
    var body: some View {
        
            NavigationStack(path: $navPaths){
                MenuItemGridView(navPaths: $navPaths).navigationDestination(for: Routes.self) { r in
                    switch(r){
                    case .info:
                        InfoView()
                    case .bordro:
                        BordroView()
                    case .qrMaker:
                        SettingsView()
                    case .qrScanner:
                        SettingsView()
                    case .settings:
                        SettingsView()
                    }
                }
            }//:Navstack
            
    }
}

#Preview {
    NavigationStackController()
}

