//
//  animationViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 29/10/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import Foundation

extension UIButton {
    
        func pulse() {
            
            let pulse = CASpringAnimation(keyPath: "transform.scale")
            pulse.duration = 0.6
            pulse.fromValue = 0.95
            pulse.toValue = 1.0
            pulse.autoreverses = true
            pulse.repeatCount = 2
            pulse.initialVelocity = 0.5
            pulse.damping = 1.0
            
            layer.add(pulse, forKey: nil)
        }
    
}
