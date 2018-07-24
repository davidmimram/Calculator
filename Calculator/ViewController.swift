//
//  ViewController.swift
//  Calculator
//
//  Created by Mimram on 7/24/18.
//  Copyright © 2018 Mimram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var cloud1: UIImageView!
    
    @IBOutlet weak var cloud2: UIImageView!
    
    @IBOutlet weak var cloud3: UIImageView!
    
    @IBOutlet weak var cloud4: UIImageView!
    
    @IBOutlet weak var airPlane: UIImageView!
    
    
    @IBOutlet weak var tvUser: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        sender.flash()
        
        if performingMath == true {
            
            tvUser.text = String(sender.tag-1)
            
            numberScreen = Double(tvUser.text!)!
            performingMath = false
        }
        else {
            tvUser.text = tvUser.text! + String(sender.tag-1)
            numberScreen = Double(tvUser.text!)!
        }
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        sender.shake()
        if tvUser.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousNumber = Double (tvUser.text!)!
            if sender.tag == 12 { // Divide
                
                tvUser.text = "/"
            }
            else if sender.tag == 13 { // Multiply
                tvUser.text = "*"
            }
            else if sender.tag == 14 { // Miuns
                tvUser.text = "-"
            }
            else if sender.tag == 15 { // Plus
                tvUser.text = "+"
            }
            
            operation = sender.tag
            performingMath = true
        }
        else if  sender.tag == 16 {
            if operation == 12 {
                tvUser.text = String (previousNumber / numberScreen)
            }
            else if operation == 13 {
                tvUser.text = String (previousNumber * numberScreen)
            }
            else if operation == 14 {
                tvUser.text = String (previousNumber - numberScreen)
            }
            else if operation == 15 {
                tvUser.text = String (previousNumber + numberScreen)
            }
        }
        else if sender.tag == 11 {
            tvUser.text = ""
            previousNumber = 0
            numberScreen = 0
            operation = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        animateCloud(cloud1)
        animateCloud(cloud2)
        animateCloud(cloud3)
        animateCloud(cloud4)
        animatedPlane(airPlane)
        
        
    }
    
    func animateCloud(_ cloud: UIImageView) {
        let cloudSpeed = 60.0 / view.frame.size.width
        let duration = (view.frame.size.width - cloud.frame.origin.x) * cloudSpeed
        UIView.animate(withDuration: TimeInterval(duration), delay: 0.0, options: .curveLinear,
                       animations: {
                        cloud.frame.origin.x = self.view.frame.size.width
        },
                       completion: {_ in
                        cloud.frame.origin.x = -cloud.frame.size.width
                        self.animateCloud(cloud)
        }
        )
    }
    
    func animatedPlane(_ plane: UIImageView) {
        let cloudSpeed = 5.0 / view.frame.size.width
        let duration = (view.frame.size.width - plane.frame.origin.x) * cloudSpeed
        UIView.animate(withDuration: TimeInterval(duration), delay: 0.0, options: .curveLinear,
                       animations: {
                        plane.frame.origin.x = self.view.frame.size.width
        },
                       completion: {_ in
                        plane.frame.origin.x = -plane.frame.size.width
                        self.animateCloud(plane)
        }
        )
    }
    
    
    
}


