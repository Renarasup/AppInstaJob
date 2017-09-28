//
//  registerViewController.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 05/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class registerViewController: UIViewController {

   
   
    @IBOutlet weak var buttonCadastrar: UIButton!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var sobreNomeTextField: UITextField!
    @IBOutlet weak var textRegisterlogin: UITextField!
    @IBOutlet weak var textRegisterloginRepeat: UITextField!
    @IBOutlet weak var textRegisterSenha: UITextField!
    @IBOutlet weak var textRegisterSenhaRepeat: UITextField!
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonCadastrar.layer.cornerRadius = 5
        
//        let database = Database.database().reference()
//        
//        let pontuacao = database.child("pontuacao")
//        let usuario = database.child("usuarios")
        
//        let usuario = database.child("usuarios")
//        usuario.child("0001").setValue("Diego Crozare")
        
//        usuario.observe(DataEventType.value, with: { (dados) in
//            print (dados)
//        })
       
    }

 
    @IBAction func buttonCadastrar(_ sender: Any) {
//        metodo para gravar local com o USERDEFAULTS

//        defaults.set(nomeTextField.text, forKey: "nome")
//        defaults.set(sobreNomeTextField.text, forKey: "sobrenome")
//        defaults.set(textRegisterlogin.text, forKey: "email")
//        defaults.set(textRegisterSenha.text, forKey: "senha")
        
        //exemplo de cadastro usando a verificacao se esta logado ou nao 
        
        
        
        let usuario = Auth.auth()
        
        usuario.createUser(withEmail: textRegisterlogin.text!, password: textRegisterSenha.text!) { (Usuario, erro) in
            
            if erro == nil {
                
                print ("usuario logado" + String( describing: Usuario?.email ) )
            }else {
                
                print ("usuario nao logado" + String( describing: erro?.localizedDescription ))
            }
        }
        
        let dataBase = Database.database().reference()
        
        let userData = dataBase.child("usuarios")
        userData.child("0002").setValue(nomeTextField.text)
        
        
        
        
//exemplo para criacao de usuario sem verificar se esta logado
//        usuario .createUser(withEmail: "josi@hotmail.com", password: "654321", completion: nil)
        
        
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
