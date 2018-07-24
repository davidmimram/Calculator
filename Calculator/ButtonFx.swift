//
//  ButtonFx.swift
//  Calculator
//
//  Created by Mimram on 7/24/18.
//  Copyright © 2018 Mimram. All rights reserved.
//
import Foundation
import UIKit

extension UIButton {
    
    
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5 , y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5 , y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
        
    }
    
    
    
    func flash(){
        let flash = CASpringAnimation(keyPath: "transform.scale")
        flash.duration = 0.6
        flash.fromValue = 0.95
        flash.toValue = 1.0
        flash.autoreverses = true
        flash.repeatCount = 2
        flash.initialVelocity = 0.5
        flash.damping = 1.0
        
        layer.add(flash, forKey: nil)
        
    }
}
