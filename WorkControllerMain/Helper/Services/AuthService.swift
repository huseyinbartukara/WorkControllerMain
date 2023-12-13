//
//  AuthService.swift
//  WorkControllerMain
//
//  Created by Bartu Kara on 12.12.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

enum AuthState{
    case undefined
    case authenticated
    case notAuthenticated
}

class AuthService : ObservableObject {
    @Published var profile = Profile()
    @Published var authState : AuthState = .undefined
    @Published var uid : String = ""
    
    init(){
        setupAuthListener()
    }
    
    func setupAuthListener(){
        Auth.auth().addStateDidChangeListener { _, user in
            self.authState = user == nil ? .notAuthenticated : .authenticated
            guard let user = user else {return}
            self.uid = user.uid
        }
    }
    
    func signUp(_ email : String, password : String, name : String, sicilNo: String) async throws{
        guard name != "" else {return}
        try await Auth.auth().createUser(withEmail: email, password: password)
        guard uid != "" else {return}
        try createProfile(name: name, sicilNo: sicilNo)
    }
    
    func createProfile(name : String, sicilNo : String) throws{
        let reference = Firestore.firestore().collection("profiles").document(uid)
        let profile = Profile(name: name, sicilNo: sicilNo, uid: uid)
        try reference.setData(from: profile)
    }
    
    func login(email: String, password : String) async throws{
        try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func logOut() throws {
        try Auth.auth().signOut()
    }
    
    func fetchProfile()async throws {
        guard uid != "" else {return}
        let references = Firestore.firestore().collection("profiles").document(uid)
        profile = try await references.getDocument(as: Profile.self)
    }
    
    
    
}
