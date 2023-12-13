//
//  MenuItemGridView.swift
//  WorkControllerMain
//
//  Created by Bartu Kara on 12.12.2023.
//

import SwiftUI

struct MenuItemGridView: View {
    
    @Binding var navPaths : [Routes]
    
    var body: some View {
        //ScrollView(.horizontal ,showsIndicators: false, content: {
            LazyVGrid(columns: gridLayout,alignment: .center, spacing: columnSpacing, content: {
                ForEach(menus) {menu in
                        Button{
                            if menu.destination == "info"{
                                navPaths.append(.info)
                            }
                            
                            if menu.destination == "bordro"{
                                navPaths.append(.bordro)
                            }
                            
                            if menu.destination == "qrMaker"{
                                navPaths.append(.qrMaker)
                            }
                            
                            if menu.destination == "qrScanner"{
                                navPaths.append(.qrScanner)
                            }
                            
                            if menu.destination == "settings"{
                                navPaths.append(.settings)
                            }
                            
                                } label: {
                                        HStack(alignment: .center, spacing: 6) {
                                            
                                            ZStack{
                                                Rectangle()
                                                    .frame(width: 70, height: 70)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.accentGray)
                                                
                                                Image(systemName:menu.image)
                                                                    .resizable()
                                                                    .scaledToFit()
                                                                    .frame(width: 50, height: 50, alignment: .center)
                                                                    .foregroundColor(.appBackground)
                                            }
                                                            
                                            
                                                                
                                                            
                                                            Text(menu.name.uppercased())
                                                                .font(.system(size: 40))
                                                                .fontWeight(.light)
                                                                .foregroundStyle(Color.accentAcik)
                                                            
                                                            Spacer()
                                                        }//: Hstack
                                                        .padding()
                                                        .background(Color.appBackground.cornerRadius(12))
                                                        .background(
                                                            RoundedRectangle(cornerRadius: 12)
                                                                .stroke(Color.gray, lineWidth: 1.5)
                                                        )
                                }//:Button
                    }//: Loop
                
            })//: Grid
            .frame(height: 140)
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
        //})//: Scroll
        .navigationDestination(for: Menu.self){ menu in
                InfoView()
        }
    }
}

#Preview {
    MenuItemGridView(navPaths: .constant([]))
}
