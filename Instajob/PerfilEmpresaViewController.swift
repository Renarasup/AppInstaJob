//
//  PerfilEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import CoreData

class PerfilEmpresaViewController: UIViewController {

    
    @IBOutlet weak var textRazaoSocial: UITextField!
    @IBOutlet weak var textCnpj: UITextField!
    @IBOutlet weak var textCidade: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textSenha: UITextField!
    
    @IBOutlet weak var buttonSalvar: UIButton!
    @IBOutlet weak var buttonFechar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.buttonSalvar.layer.cornerRadius = 10
        self.buttonFechar.layer.cornerRadius = 10
    }

    @IBAction func salvarButton(_ sender: Any) {
    }
 
    @IBAction func fecharButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
