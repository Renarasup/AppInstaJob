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
    @IBOutlet weak var buttonCadastrar: UIButton!
    @IBOutlet weak var buttonFechar: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

      self.buttonCadastrar.layer.cornerRadius = 10
      self.buttonFechar.layer.cornerRadius = 10
    }
    
    @IBAction func buttonCadastrarEmpresa(_ sender: Any) {
        
        let user = Auth.auth()
        
        let dadosEmpresa = ["Razao Social" : textRazaoSocial.text,
                            "CNPJ" : textCnpj.text,
                            "Cidade" : cidadeEmpresa.text,
                            "Email" : textEmailEmpresa.text,
                            "Senha" : textSenha.text]
        
        user.createUser(withEmail: textEmailEmpresa.text!, password: textSenha.text!) { (usuario, erro) in
            if erro == nil {
                docRef = Database.database().reference()
                let id = usuario?.uid
                let criarVaga = docRef.child("empresa").child(id!)
                criarVaga.setValue(dadosEmpresa)
            }else {
                print ("usuario nao logado" + String( describing: erro?.localizedDescription ))
            }
        }
        dismiss(animated: true, completion: nil)
    }

    
    
        
    
    @IBAction func buttonDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
