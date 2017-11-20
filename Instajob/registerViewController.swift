//
//  registerViewController.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 05/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//
import UIKit
import FirebaseAuth
import Firebase

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
    }
    @IBAction func buttonCadastrar(_ sender: Any) {
        
        let usuario = Auth.auth()
        
        let dadosUsuario = ["Nome": nomeTextField.text! ,
                            "SobreNome":sobreNomeTextField.text!,
                            "Login":textRegisterlogin.text!,
                            "Senha" : textRegisterSenha.text!]
        
        usuario.createUser(withEmail: textRegisterlogin.text!, password: textRegisterSenha.text!) { (usuario, erro) in
            if erro == nil {
                let docRef = Database.database().reference()
                let id = usuario?.uid
                let criarVaga = docRef.child("candidato").child(id!)
                criarVaga.setValue(dadosUsuario)
            }else {
                print ("usuario nao logado" + String( describing: erro?.localizedDescription ))
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
