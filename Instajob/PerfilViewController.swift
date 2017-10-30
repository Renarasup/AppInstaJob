//
//  PerfilViewController.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 11/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class PerfilViewController: UIViewController {

  
    
    @IBOutlet weak var buttonSalvarPerfil: UIButton!
    @IBOutlet weak var buttonFecharPerfil: UIButton!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var sobreNomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var fotoPerfil: UIImageView!
    @IBOutlet var labelDark: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //formatando botao
     buttonSalvarPerfil.layer.cornerRadius = 10
     buttonFecharPerfil.layer.cornerRadius = 10
     fotoPerfil.layer.cornerRadius = 42
     fotoPerfil.clipsToBounds = true
        
    }

    @IBAction func buttonSalvarPerfil(_ sender: Any) {

      nomeTextField.text = ""
      sobreNomeTextField.text = ""
      emailTextField.text = ""
      senhaTextField.text = ""
        
         }
   
    @IBAction func buttonDismiss(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
   
    
}

