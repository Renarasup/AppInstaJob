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
    @IBOutlet weak var textRegisterLoginRepeat: UITextField!
    @IBOutlet weak var textRegisterSenha: UITextField!
    @IBOutlet weak var textRegisterSenhaRepeat: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        buttonCadastrar.layer.cornerRadius = 5
        
        //criando referencia para o banco de dados do firebase
         let database = Database.database().reference()
        
        //criando banco de dados
         let usuario = database.child("usuarios")
        //setando valor no banco, com chave e valor
        // usuario.child(valor).setValue("Diego Crozare")
        
        //criando um observador para atualizar altomativamente os dados do banco
        usuario.observe(DataEventType.value, with: { (dados) in
            print (dados)
        })
    }
 
    @IBAction func buttonCadastrar(_ sender: Any) {

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
        userData.childByAutoId().setValue(nomeTextField.text)
        

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
