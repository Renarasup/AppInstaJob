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
    
    let veja = CandidatoViewController()
    var docRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //formatando botao
        buttonSalvarPerfil.layer.cornerRadius = 10
        buttonFecharPerfil.layer.cornerRadius = 10
        fotoPerfil.layer.cornerRadius = 42
        fotoPerfil.clipsToBounds = true
        
        docRef = Database.database().reference()
        veja.usuario.addStateDidChangeListener { (Auth, usuario) in
            if let usuarioLogado = usuario {
                self.docRef.child("candidato").child(usuarioLogado.uid).observe(DataEventType.value, with: { (dados) in
                    
                    if let valor = dados.value as? NSDictionary{
                        self.emailTextField.text = valor["Login"] as? String
                        self.nomeTextField.text = valor["Nome"] as? String
                        self.sobreNomeTextField.text = valor["SobreNome"] as? String
                    }
                })
                
            }else {
                print("usuario nao logado")
            }
        }
        
        
    }
    
    @IBAction func buttonSalvarPerfil(_ sender: Any) {

      nomeTextField.text = ""
      sobreNomeTextField.text = ""
      emailTextField.text = ""
      senhaTextField.text = ""
        
         }
   
    @IBAction func buttonDismiss(_ sender: Any) {
        
        let usuario = veja.usuario
        
        do {
            try usuario.signOut()
            print("deslogado com sucesso")
        } catch {
            print("erro ao deslogar usuario")
        }

        dismiss(animated: true, completion: nil)
    }
   
    
}

