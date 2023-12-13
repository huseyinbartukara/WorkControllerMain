//
//  FirestoreService.swift
//  WorkControllerMain
//
//  Created by Bartu Kara on 12.12.2023.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class FirestoreService : ObservableObject {
    
    private var currentUser = Auth.auth().currentUser?.uid
    @Published var profile : Profile?
    
    func fetchDocument(documentID: String) {
        let db = Firestore.firestore()
        let documentReference = db.collection("profiles").document(documentID)

        documentReference.getDocument { document, error in
            if let document = document, document.exists {
                let data = document.data()
                let name = data?["name"] as? String ?? ""
                let sicilNo = data?["sicilNo"] as? String ?? ""

                DispatchQueue.main.async {
                    self.profile = Profile(name: name, sicilNo: sicilNo, uid: Auth.auth().currentUser?.uid)
                }
            } else {
                        print("Belge bulunamadı: \(error?.localizedDescription ?? "")")
            }
        }
    }
}
