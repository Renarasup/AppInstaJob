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

class CandidateViewController: UIViewController {
    
    @IBOutlet weak var textLogin: UITextField!
    @IBOutlet weak var textSenha: UITextField!
    @IBOutlet weak var buttonEntrar: UIButton!
    @IBOutlet weak var buttonCadastrar: UIButton!
    @IBOutlet weak var resetSenha: UIButton!
    
    var usuario = Auth.auth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    @IBAction func buttonHome(_ sender: Any) {
        loginCandidate()
    }
    
    @IBAction func resetSenha(_ sender: Any) {
        resetPassword()
    }
    
    @IBAction func buttonDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func resetPassword() {
        let email = textLogin.text
        Auth.auth().sendPasswordReset(withEmail: email!) { (error) in
            if error == nil {
                //Alert Envio com sucesso
            }else{
                //Alert Erro de envio
            }
        }
    }
    
    func loginCandidate() {
        self.usuario.signIn(withEmail: textLogin.text!, password: textSenha.text!) { (usuario, erro) in
            if erro == nil {
                print ("acesso autorizado")
                self.textLogin.text = ""
                self.textSenha.text = ""
                self.performSegue(withIdentifier: "loginCandidato", sender: nil)
            }else {
                let alertaController = UIAlertController(title: "Erro", message: "seu login ou senha esta incorreto", preferredStyle: .alert)
                let alertaConfirmar = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertaController.addAction(alertaConfirmar)
                self.present(alertaController, animated: true, completion: nil)
            }
        }
    }
    
    func setupLayout() {
        buttonEntrar.layer.cornerRadius = 10
        buttonCadastrar.layer.cornerRadius = 10
        self.resetSenha.layer.cornerRadius = 10
    }
}

