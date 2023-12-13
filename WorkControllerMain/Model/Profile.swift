//
//  Profile.swift
//  WorkControllerMain
//
//  Created by Bartu Kara on 12.12.2023.
//

import SwiftUI

class Profile:Codable {
    var name : String
    var sicilNo : String
    var uid : String
    
    init(name: String? = nil, sicilNo : String? = nil, uid : String? = nil) {
        self.name = name ?? ""
        self.sicilNo = sicilNo ?? ""
        self.uid = uid ?? ""
    }
    
}
