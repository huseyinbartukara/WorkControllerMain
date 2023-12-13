//
//  InfoView.swift
//  WorkControllerMain
//
//  Created by Bartu Kara on 12.12.2023.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

struct InfoView: View {
    
    private var currentUser = Auth.auth().currentUser?.uid
    let db = Firestore.firestore()
    
    @EnvironmentObject private var firestoreService : FirestoreService
    
    
    var body: some View {
        ZStack{
            AppBackground()
            VStack{
                ZStack{
                    CardView()
                    HStack(spacing: 20){
                        VStack(alignment: .leading){
                            Text("Hüseyin Bartu Kara")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .foregroundStyle(.appBackground)
                            Text("1821012031")
                                .font(.system(size: 20))
                                .foregroundStyle(.appBackground)
                        }
                        Image(systemName: "person.circle")
                            .font(.system(size: 50))
                            .foregroundStyle(.appBackground)
                    }
                }
                
            }
        }.onAppear{
            //FirestoreService().fetchDocument(documentID: currentUser ?? "")
        }
    }
    
    
    
    
}

#Preview {
    InfoView()
}
