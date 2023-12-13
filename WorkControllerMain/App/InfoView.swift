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
    
    @State private var document: MyDocument?
    @State private var documentID: String = Auth.auth().currentUser!.uid
   
    
    
    var body: some View {
        ZStack{
            AppBackground()
            VStack{
                ZStack{
                    CardView()
                    HStack(spacing: 20){
                        VStack(alignment: .leading){
                            Text(document?.name ?? "vay")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .foregroundStyle(.appBackground)
                            Text(document?.sicilNo ?? "vay")
                                .font(.system(size: 20))
                                .foregroundStyle(.appBackground)
                        }
                        Image(systemName: "person.circle")
                            .font(.system(size: 50))
                            .foregroundStyle(.appBackground)
                    }
                }
                Spacer()
                
            }
        }.onAppear {
            fetchDocument()
        }
    }
    
    
        func fetchDocument() {
                FirebaseService.shared.fetchDocument(documentID: documentID) { result in
                    switch result {
                    case .success(let fetchedDocument):
                        self.document = fetchedDocument
                    case .failure(let error):
                        print("Hata: \(error.localizedDescription)")
                    }
                }
            }
        
    
    
}

#Preview {
    InfoView()
}



