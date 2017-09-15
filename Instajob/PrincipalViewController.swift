//
//  PrincipalViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 14/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit

class PrincipalViewController: UIViewController {

   
    
    
    @IBOutlet weak var butonCandidato: UIButton!
    
    @IBOutlet weak var buttonEmpresa: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonEmpresa.layer.cornerRadius = 15
    
        butonCandidato.layer.cornerRadius = 15
    
    }

   

}
