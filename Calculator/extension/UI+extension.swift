//
//  UI+extension.swift
//  Calculator
//
//  Created by Neosoft on 30/04/20.
//  Copyright © 2020 webwerks. All rights reserved.
//

import UIKit

extension UIButton{
    func setBtnProperties(bgColor:UIColor,borderColor:UIColor,titleColor:UIColor=UIColor.black){
        self.backgroundColor = bgColor
        self.setTitleColor(UIColor.textColor, for: .normal)
        self.layer.cornerRadius = 10
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 3
        self.setTitleColor(titleColor, for: .normal)
    }
}


extension NumberFormatter {
     func numFormatter(temp:Double)->String{
        
        self.groupingSeparator = ","
        self.groupingSize = 3
        self.numberStyle = .decimal
        self.locale = Locale.current
        return self.string(from: temp as NSNumber)!
        
    }
}
