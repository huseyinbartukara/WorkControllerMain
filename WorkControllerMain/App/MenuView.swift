//
//  ContentView.swift
//  WorkControllerMain
//
//  Created by Bartu Kara on 12.12.2023.
//

import SwiftUI

struct MenuView: View {
    
    init() {
      // Large Navigation Title
      UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
      // Inline Navigation Title
      UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                AppBackground()
                VStack{
                    NavigationStackController()
                }
            }.navigationTitle("Anasayfa")
                
            
        }
    }
}

#Preview {
    MenuView()
}
