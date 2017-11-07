//
//  ViewController.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 05/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class CandidatoViewController: UIViewController {

   
    @IBOutlet weak var textLogin: UITextField!
    @IBOutlet weak var textSenha: UITextField!
    @IBOutlet weak var buttonEntrar: UIButton!
    @IBOutlet weak var buttonCadastrar: UIButton!
    @IBOutlet weak var resetSenha: UIButton!
    
    var usuario = Auth.auth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonEntrar.layer.cornerRadius = 10
        buttonCadastrar.layer.cornerRadius = 10
        self.resetSenha.layer.cornerRadius = 10
        }

    @IBAction func buttonHome(_ sender: Any) {
        
        self.usuario.signIn(withEmail: textLogin.text!, password: textSenha.text!) { (usuario, erro) in
            if erro == nil {
                print ("acesso autorizado")
                self.textLogin.text = ""
                self.textSenha.text = ""
            }else {
                DispatchQueue.main.async {
                    print ("erro ao logar no app")
                    let alertaController = UIAlertController(title: "Sucesso", message: "seus dados foram salvos", preferredStyle: .alert)
                    let alertaConfirmar = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertaController.addAction(alertaConfirmar)
                    self.present(alertaController, animated: true, completion: nil)
                }
                print("chegou aki")
            }
        }
    }

    @IBAction func resetSenha(_ sender: Any) {
        let email = textLogin.text
        Auth.auth().sendPasswordReset(withEmail: email!) { (error) in
            if error == nil {
                 print("o email foi enviado")
            }else{
               print("ocorreu algum erro")
            }
        }
    }
    
    @IBAction func buttonDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

