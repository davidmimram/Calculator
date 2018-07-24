//
//  RoundBtn.swift
//  Calculator
//
//  Created by Mimram on 7/24/18.
//  Copyright © 2018 Mimram. All rights reserved.
//

import UIKit

@IBDesignable
class RoundBtn: UIButton {
    
    @IBInspectable var cornerRaduis : CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRaduis
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }

    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
