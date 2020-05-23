//
//  ViewExtension.swift
//  01-Demo
//
//  Created by IDS Comercial on 22/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import SwiftUI

extension View {
    func subTitleStyle() -> some View {
         self.modifier(Title())
    }
}
