//
//  LoginViewModel.swift
//  01-Demo
//
//  Created by IDS Comercial on 25/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var nameImege:String = "ic_fondo_1"
    @Published var nameLogo:String = "Logo"
    @Published var versionApp : String = "Version 1.0"

    
    init() {
        //
    }

}
