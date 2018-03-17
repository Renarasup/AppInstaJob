//
//  OptionVagasViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 29/10/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit

class OptionVagasViewController: UIViewController {

 
    @IBOutlet weak var cadastrarVaga: UIButton!
    @IBOutlet weak var visualizarVaga: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cadastrarVaga.layer.cornerRadius = 15
        self.visualizarVaga.layer.cornerRadius = 15
    
    }

 

}
