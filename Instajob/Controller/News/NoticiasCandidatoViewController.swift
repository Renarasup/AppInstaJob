//
//  NoticiasCandidatoViewController.swift
//  Instajob
//
//  Created by Diego William Crozare on 13/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit

class NoticiasCandidatoViewController: UIViewController {

    @IBOutlet weak var img1: UIButton!
    @IBOutlet weak var img2: UIButton!
    @IBOutlet weak var img3: UIButton!
    
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.img1.layer.cornerRadius = 20
        self.img2.layer.cornerRadius = 20
        self.img3.layer.cornerRadius = 20
        
        
    }
}
