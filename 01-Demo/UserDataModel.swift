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

struct UserDataModel: Codable, Hashable, Equatable, Identifiable {
    
    var id: Int
    var nombre:String
    var apellido:String
    var edad:Int
    var estado:String
    var tipo:Bool
    
    
    #if DEBUG
    static let example = UserDataModel(id: 1,nombre: "Osvaldo", apellido: "Cespedes Hernandez", edad: 23, estado: "Monterrey", tipo: false)
    #endif
}
