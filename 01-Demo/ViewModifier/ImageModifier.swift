//
//  ImageModifier.swift
//  01-Demo
//
//  Created by IDS Comercial on 26/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import SwiftUI

struct YellowImage:ViewModifier {
        
    func body(content:Content) -> some View {
        content
        .foregroundColor(.yellow)
        .imageScale(.medium)
    }
    
}

