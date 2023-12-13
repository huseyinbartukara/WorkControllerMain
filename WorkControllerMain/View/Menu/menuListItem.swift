//
//  menuListItem.swift
//  WorkControllerMain
//
//  Created by Bartu Kara on 12.12.2023.
//

import SwiftUI

struct menuListItem: View {
    // MARK: - Properties
    
    let menu : Menu
    
    // MARK: - Body
    var body: some View {
        Button(action: {
            
            
            
        }, label: {
            HStack(alignment: .center, spacing: 6){
                
                ZStack{
                    Rectangle()
                        .frame(width: 70, height: 70)
                        .cornerRadius(20)
                        .foregroundStyle(.accentGray)
                    Image(systemName: menu.image)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundStyle(.appBackground)
                }
                
                
                
                Text(menu.name.uppercased())
                    .font(.system(size: 30))
                    .fontWeight(.light)
                    .foregroundStyle(.accentGray)
                
                Spacer()
                
            }//: Hstack
            .padding()
            .background(Color.appBackground.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.accentGray, lineWidth: 3)
            )
            
        })//: Button
        //.background(.appBackground)
    }
}

#Preview {
    menuListItem(menu: menus[0])
}
