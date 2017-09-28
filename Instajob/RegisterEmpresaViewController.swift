//
//  RegisterEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit

class RegisterEmpresaViewController: UIViewController {

 
    
    @IBOutlet weak var textRazaoSocial: UITextField!
   // @IBOutlet weak var textCnpj:JMMaskTextField!
    @IBOutlet weak var textCnpjRepeat: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

 
    @IBAction func buttonCadastrarEmpresa(_ sender: Any) {
    }

    @IBAction func buttonDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
