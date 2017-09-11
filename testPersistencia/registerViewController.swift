//
//  registerViewController.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 05/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit

class registerViewController: UIViewController {

    
   
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var sobreNomeTextField: UITextField!
    @IBOutlet weak var textRegisterlogin: UITextField!
    @IBOutlet weak var textRegisterSenha: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

 
    @IBAction func buttonCadastrar(_ sender: Any) {
        
        defaults.set(nomeTextField.text, forKey: "nome")
        defaults.set(sobreNomeTextField.text, forKey: "sobrenome")
        defaults.set(textRegisterlogin.text, forKey: "email")
        defaults.set(textRegisterSenha.text, forKey: "senha")
        
        nomeTextField.text = ""
        sobreNomeTextField.text = ""
        textRegisterlogin.text = ""
        textRegisterSenha.text = ""
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func buttonCancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
   
  

}
