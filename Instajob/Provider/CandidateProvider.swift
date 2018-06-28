//
//  CandidateProvider.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 23/06/2018.
//  Copyright © 2018 Diego William Crozare. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CandidateProvider: NSObject {
    
    func resetPassword(email: UITextField) {
        //let email = textLogin.text
        Auth.auth().sendPasswordReset(withEmail: email.text) { (error) in
            if error == nil {
                Alert.alert(message: "chegara em instantes os passos para voce resetar sua senha em seu email", buttonTitle: "OK", viewController: self)
            }else{
                Alert.alert(message: "Houve um problema, tente novamente em instantes", buttonTitle: "OK", viewController: self)
            }
        }
    }

    func loginCandidate(email: UITextField, password: UITextField) {
        
        self.usuario.signIn(withEmail: email.text, password: password.text) { (usuario, erro) in
            if erro == nil {
                self.email.text = ""
                self.password.text = ""
                self.performSegue(withIdentifier: "loginCandidato", sender: nil)
            }else {
                Alert.alert("Erro", message: "seu login ou senha esta incorreto", buttonTitle: "OK", viewController: self)
            }
        }
    }

}
