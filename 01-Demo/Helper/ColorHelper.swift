//
//  ColorHelper.swift
//  01-Demo
//
//  Created by IDS Comercial on 20/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    struct ThemeGreen {
        static var firstColor: UIColor  { return UIColor(red: 1, green: 0, blue: 0, alpha: 1) }
        static var secondColor: UIColor { return UIColor(red: 0, green: 1, blue: 0, alpha: 1) }
    }
    
    struct ThemeBlue {
        static var firstColor: UIColor  { return UIColor.blue }
        static var secondColor: UIColor { return UIColor.red }
    }
    
}
