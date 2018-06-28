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
    let business = CandidateBusiness()
    
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
//        let email = textLogin.text
        business.resetPassword(email: textLogin)
    }
    
    func loginCandidate() {
        business.loginCandidate(email: textLogin, password: UITextFieldtextSenha)
    }
    
    func setupLayout() {
        buttonEntrar.layer.cornerRadius = 10
        buttonCadastrar.layer.cornerRadius = 10
        self.resetSenha.layer.cornerRadius = 10
    }
}

