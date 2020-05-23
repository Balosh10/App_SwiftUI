//
//  TextModifier.swift
//  01-Demo
//
//  Created by IDS Comercial on 22/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import SwiftUI

struct Title:ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.system(size: 14, weight: .heavy, design: .default))
        .foregroundColor(Color.black.opacity(0.8))
    }
}
