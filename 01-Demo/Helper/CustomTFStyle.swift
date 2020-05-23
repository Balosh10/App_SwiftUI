//
//  CustomTFStyle.swift
//  01-Demo
//
//  Created by IDS Comercial on 22/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import SwiftUI
 
public struct CustomTFStyle : TextFieldStyle {
    
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .accentColor(.white)
            .frame(width: 280, height: 23, alignment: .center)
            .border(Color.clear, width: 4)
            .font(.system(size: 14, weight: .heavy, design: .default))
            .multilineTextAlignment(.center)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 12)
            .foregroundColor(.black)

    }
    
}
