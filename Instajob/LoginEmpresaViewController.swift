//
//  LoginEmpresaViewController.swift
//  Instajob
//
//  Created by Diego William Crozare on 12/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class LoginEmpresaViewController: UIViewController {

    
    @IBOutlet weak var loginEmpresaTextfield: UITextField!
    @IBOutlet weak var senhaEmpresaTextfield: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let database = Database.database().reference()

        let usuario = database.child("usuarioEmpresa")
 
        usuario.observe(DataEventType.value, with: { (dados) in
            print (dados)
        })
 
        
    }

    @IBAction func buttonEntrarEmpresa(_ sender: Any) {
        
        let usuario = Auth.auth()
        
        usuario.signIn(withEmail: loginEmpresaTextfield.text!, password: senhaEmpresaTextfield.text!) { (usuario, erro) in
            
            if erro == nil {
                
                print ("acesso autorizado")
                
            }else {
                
                
                let alertController = UIAlertController(title: "Acesso negado", message: "Email ou Senha incorretos", preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
            }
            
        }
    }
 
    @IBAction func buttonCadastrarEmpresa(_ sender: Any) {
    }
    
    @IBAction func buttonDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    

}
