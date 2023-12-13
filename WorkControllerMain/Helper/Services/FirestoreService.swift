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



struct MyDocument: Codable {
    var uid: String
    var name: String
    var sicilNo : String
    // Diğer özellikleri ekleyebilirsiniz.
}

class FirebaseService : ObservableObject {
    static let shared = FirebaseService()

        private init() {}

        func fetchDocument(documentID: String, completion: @escaping (Result<MyDocument, Error>) -> Void) {
            let db = Firestore.firestore()
            let documentReference = db.collection("profiles").document(documentID)

            documentReference.getDocument { document, error in
                if let document = document, document.exists {
                    do {
                        let decodedDocument = try document.data(as: MyDocument.self)
                        completion(.success(decodedDocument))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        let customError = NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "Belge bulunamadı"])
                        completion(.failure(customError))
                    }
                }
            }
        }
}
