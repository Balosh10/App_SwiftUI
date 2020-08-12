//
//  RegisterViewModel.swift
//  01-Demo
//
//  Created by IDS Comercial on 08/07/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseAnalytics

class RegisterViewModel: ObservableObject {
    
    @Published var nameImege:String = "ic_fondo_1"
    @Published var nameLogo:String = "Logo"
    @Published var versionApp : String = "Version 1.0"
    
    @Published var email : String? = nil
    @Published var password : String? = nil
    
    init() {
        //
    }

    func validateRegisterUser(_email:String?, _password:String?){

       do {
           try self.RegisterValidation(email:_email, password:_password)
       } catch DataUserError.email {
        print("Error Email")
       } catch DataUserError.password {
          print("Error Pssword")
       } catch {
          print("Error default")
       }
        
    }
    
    private func RegisterValidation(email:String?, password:String?) throws {
        
        if email == nil || email!.isEmpty {
            throw DataUserError.email
        }
        
        if password == nil || password!.isEmpty {
            throw DataUserError.password
        }
        
        Auth.auth().createUser(withEmail: email!, password: password!) {
            (result, error) in
            if let result = result, error == nil {
                print("usuario registrado:: Data::\(result.user.email)")
            } else {
                print("Error al iniciar el login")
            }
        }
    }
}
