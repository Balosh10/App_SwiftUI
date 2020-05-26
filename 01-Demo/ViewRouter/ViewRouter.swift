//
//  ViewRouter.swift
//  01-Demo
//
//  Created by IDS Comercial on 25/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter:ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage:String = Views.LoginView.rawValue {
        didSet {
            objectWillChange.send(self)
        }
    }
}
