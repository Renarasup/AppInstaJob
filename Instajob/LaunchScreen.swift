//
//  LaunchViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 29/10/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit

class LaunchScreen: UIViewController {

    
    @IBOutlet weak var myImage: UIImageView!

    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(LaunchScreen.updateImage), userInfo: nil, repeats: true)
    }
    
    
    func updateImage() {
        self.myImage.image = UIImage(named: "\(count)")
        count = count + 1
        if count > 74 {
            count = 0
        }
    }
}
