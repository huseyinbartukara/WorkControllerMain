//
//  CardView.swift
//  WorkControllerMain
//
//  Created by Bartu Kara on 12.12.2023.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 350, height: 100)
                .cornerRadius(20)
                .foregroundStyle(.accentAcik)
        }
    }
}

#Preview {
    CardView()
}
