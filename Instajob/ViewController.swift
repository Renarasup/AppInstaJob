//
//  ViewController.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 05/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var textLogin: UITextField!
    @IBOutlet weak var textSenha: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonHome(_ sender: Any) {
        
        let userLogin = textLogin.text
        let userSenha = textSenha.text
        
        let dataLogin = UserDefaults.standard.string(forKey: "email")
        let dataSenha = UserDefaults.standard.string(forKey: "senha")
        
        if userLogin != dataLogin || userSenha != dataSenha {
            
            let alertaController = UIAlertController(title: "Senha ou Email Incorreto", message: "insira os dados corretos para acessar o sistema", preferredStyle: .alert)
            let alertaConfirmar = UIAlertAction(title: "OK", style: .default, handler: nil )
            alertaController.addAction(alertaConfirmar)
        
            present(alertaController, animated: true, completion: nil)
        
        }else {
            
            
            print ("login sucesso")
        }
        
    }

}

