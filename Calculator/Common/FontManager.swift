//
//  FontManager.swift
//  Calculator
//
//  Created by Neosoft on 30/04/20.
//  Copyright © 2020 webwerks. All rights reserved.
//

import Foundation
import UIKit
// MARK: - Font Parts
enum FontName: String {
    case system
    case systemBold
    case systemItalic
    case robotoBold = "Roboto-Bold"
    case robotoRegular = "Roboto-Regular"
    case robotoMedium = "Roboto-Medium"
    case georgiaBold = "Georgia-Bold"

}


enum FontWeight: String {
    case regular = "", medium, light, heavy, bold, semibold, black
}

enum FontSize: CGFloat {
    case title = 21, headLine2 = 27, headLine3 = 19
    case tabItem = 9
    case bodyXL = 17, bodyL = 15, bodyM = 13, bodyS = 11, bodyXS = 10
    case buttonSize = 14
}

class FontManager {

   static func font(_ fontName: FontName, size: FontSize) -> UIFont {
        
        switch fontName {
        case .system:
            return UIFont.systemFont(ofSize: size.rawValue)
            
        case .systemBold:
            return UIFont.boldSystemFont(ofSize: size.rawValue)

        default:
            return UIFont(name: fontName.rawValue, size: size.rawValue)
                ?? UIFont.systemFont(ofSize: size.rawValue)
        }
    }
}
