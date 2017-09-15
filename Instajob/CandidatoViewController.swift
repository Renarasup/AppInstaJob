//
//  ViewController.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 05/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import FirebaseAuth


class CandidatoViewController: UIViewController {

   
    @IBOutlet weak var textLogin: UITextField!
    @IBOutlet weak var textSenha: UITextField!
    @IBOutlet weak var buttonEntrar: UIButton!
    @IBOutlet weak var buttonCadastrar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonEntrar.layer.cornerRadius = 10
        buttonCadastrar.layer.cornerRadius = 10
        
        
        
    }

    @IBAction func buttonHome(_ sender: Any) {
        
//          funcao UserDefaults
////        
//        let userLogin = textLogin.text
//        let userSenha = textSenha.text
        
//        let dataLogin = UserDefaults.standard.string(forKey: "email")
//        let dataSenha = UserDefaults.standard.string(forKey: "senha")
//        
//        if userLogin != dataLogin || userSenha != dataSenha {
//            
//            let alertaController = UIAlertController(title: "Senha ou Email Incorreto", message: "insira os dados corretos para acessar o sistema", preferredStyle: .alert)
//            let alertaConfirmar = UIAlertAction(title: "OK", style: .default, handler: nil )
//            alertaController.addAction(alertaConfirmar)
//        
//            present(alertaController, animated: true, completion: nil)
//        
//        }else {
//            
//            
//            print ("login sucesso")
//        }
       
        let usuario = Auth.auth()
        
        usuario.signIn(withEmail: textLogin.text!, password: textSenha.text!) { (Usuario, erro) in
            
            if erro == nil {
                
                print ("acesso autorizado")
            
            }else {
                
                
                let alertController = UIAlertController(title: "Acesso negado", message: "Email ou Senha incorretos", preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
            }

        }
        
        
    }

}

