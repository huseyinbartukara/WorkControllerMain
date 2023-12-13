//
//  MenuModel.swift
//  WorkControllerMain
//
//  Created by Bartu Kara on 12.12.2023.
//

import Foundation


struct Menu : Hashable, Codable , Identifiable {
    let id : Int
    let name : String
    let image : String
    let destination : String
}


