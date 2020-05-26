//
//  UserDataModel.swift
//  01-Demo
//
//  Created by IDS Comercial on 20/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import SwiftUI

enum TipoCell:Int {
    case image = 1, video = 2, text = 3
}

struct AppsModel: Codable, Hashable, Equatable, Identifiable {
    
    var id: Int
    var name_app:String
    var company:String
    var turn:String
    var platform:String
    var status_app:Bool
    var messaje_app:String
    
    #if DEBUG
    static let example = AppsModel(id: 1,name_app: "Osvaldo", company: "Cespedes Hernandez", turn: "Red", platform: "Monterrey", status_app: false,messaje_app:"App")
    #endif
}
