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
    @IBOutlet weak var buttonEntrarEmpresa: UIButton!
    @IBOutlet weak var buttonCadastrarEmpresa: UIButton!
    
    let usuario = Auth.auth()
    
    override func viewDidLoad() {
        super.viewDidLoad()


       self.buttonEntrarEmpresa.layer.cornerRadius = 10
       self.buttonCadastrarEmpresa.layer.cornerRadius = 10
        
    }

    @IBAction func buttonEntrarEmpresa(_ sender: Any) {
        
        
        
        self.usuario.signIn(withEmail: loginEmpresaTextfield.text!, password: senhaEmpresaTextfield.text!) { (usuario, erro) in
            
            if usuario != nil{
                
                print ("acesso autorizado")
                self.performSegue(withIdentifier: "loginEmpresa", sender: nil)
            }else {
                
                self.alert()
                print("acesso nao autorizado")
            }
            
        }
    }
 
    func alert(){
        let alertController = UIAlertController(title: "Acesso negado", message: "Email ou Senha incorretos", preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func buttonCadastrarEmpresa(_ sender: Any) {
    }
    
    @IBAction func buttonDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    

}
