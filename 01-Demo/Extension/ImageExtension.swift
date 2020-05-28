//
//  ColorExtension.swift
//  01-Demo
//
//  Created by IDS Comercial on 26/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import SwiftUI

extension View {
    func colorYellowStyle() -> some View {
        self.modifier(YellowImage())
    }
}
