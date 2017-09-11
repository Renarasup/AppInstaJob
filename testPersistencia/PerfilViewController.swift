//
//  PerfilViewController.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 11/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {

    
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var sobreNomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

     nomeTextField.text = defaults.string(forKey: "nome")
     sobreNomeTextField.text = defaults.string(forKey: "sobrenome")
     emailTextField.text = defaults.string(forKey: "email")
     senhaTextField.text = defaults.string(forKey: "senha")
    
    }

    @IBAction func buttonSalvarPerfil(_ sender: Any) {
        
      defaults.set(nomeTextField.text, forKey: "nome")
      defaults.set(sobreNomeTextField.text, forKey: "sobrenome")
      defaults.set(emailTextField.text, forKey: "email")
      defaults.set(senhaTextField.text, forKey: "senha")
      defaults.synchronize()
        
      nomeTextField.text = ""
      sobreNomeTextField.text = ""
      emailTextField.text = ""
      senhaTextField.text = ""
        
      let alertaController = UIAlertController(title: "Sucesso", message: "seus dados foram salvos", preferredStyle: .alert)
        let alertaConfirmar = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertaController.addAction(alertaConfirmar)
        present(alertaController, animated: true, completion: nil)
    }
    
}
