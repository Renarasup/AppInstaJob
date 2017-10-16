//
//  RegisterEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import JMMaskTextField_Swift
import FirebaseAuth
import FirebaseDatabase


class RegisterEmpresaViewController: UIViewController {

 
    
    @IBOutlet weak var textRazaoSocial: UITextField!
    @IBOutlet weak var textCnpj:JMMaskTextField!
    @IBOutlet weak var cidadeEmpresa: UITextField!
    @IBOutlet weak var textSenha: UITextField!
    @IBOutlet weak var textRepeatSenha: UITextField!
    @IBOutlet weak var textEmailEmpresa: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

 
    @IBAction func buttonCadastrarEmpresa(_ sender: Any) {
        
        let usuario = Auth.auth()
        
        
        usuario.createUser(withEmail: textEmailEmpresa.text!, password: textSenha.text!) { (Usuario, erro) in
            
            if erro == nil {
                
                print ("usuario Empresa logado" + String( describing: Usuario?.email ) )
            }else {
                
                print ("usuario nao logado" + String( describing: erro?.localizedDescription ))
            }
        }
        
        let dataBase = Database.database().reference()
        
        let userEmpresa = dataBase.child("usuarioEmpresa")
        
        userEmpresa.childByAutoId().child("Razao social").setValue(textRazaoSocial.text)
        //userEmpresa.childByAutoId().
        
        textRazaoSocial.text = ""
        textCnpj.text = ""
        cidadeEmpresa.text = ""
        textSenha.text = ""
        textRepeatSenha.text = ""
        textEmailEmpresa.text = ""
        
        dismiss(animated: true, completion: nil)
    }

    
    
        
    
    @IBAction func buttonDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
