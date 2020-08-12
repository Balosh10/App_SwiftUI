//
//  LoginViewModel.swift
//  01-Demo
//
//  Created by IDS Comercial on 25/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseAnalytics

enum DataUserError: Error {
    case email
    case password
}

class LoginViewModel: ObservableObject {
    
    @Published var nameImege:String = "ic_fondo_1"
    @Published var nameLogo:String = "Logo"
    @Published var versionApp : String = "Version 1.0"
    
    @Published var email : String? = nil
    @Published var password : String? = nil
    
    init() {
        //
    }

    func validateLogin(_email:String?, _password:String?) -> (succes: Bool, Error:String) {
        
       
        
        Auth.auth().signIn(withEmail: email!, password: password!) {
            (result, error) in
            
            if let result = result, error == nil {
                print("inicio de sessión exitosa::\(result.user.email ?? "")")
               
            } else {
            }
        }
  
       return (succes: false, Error:"Ups! ocurrio un error vuelvelo a intertar mas tarde")
    }

}
