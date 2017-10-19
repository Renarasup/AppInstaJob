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
    @IBOutlet weak var subTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonEmpresa.layer.cornerRadius = 15
        butonCandidato.layer.cornerRadius = 15
        self.subTitle.alpha = 0

        animation()
    
    }

    func animation()
    {
        UIView.animate(withDuration: 3) {
            self.butonCandidato.frame.origin = CGPoint(x: -250, y: self.butonCandidato.frame.origin.y)
            self.buttonEmpresa.frame.origin = CGPoint(x: 350, y: self.buttonEmpresa.frame.origin.y)
        }
        UIView.animate(withDuration: 7) {
            self.subTitle.alpha = 1
        }
    }

}
