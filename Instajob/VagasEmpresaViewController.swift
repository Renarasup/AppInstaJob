//
//  VagasEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase
import FirebaseAuth




class VagasEmpresaViewController: UIViewController {
    
    @IBOutlet weak var textTituloVaga: UITextField!
    @IBOutlet weak var textDescriptionVaga: UITextView!
    @IBOutlet weak var buttonCadastrar: UIButton!
    @IBOutlet weak var textNameEmpresa: UITextField!
    
    var razaoSocial:String = ""
    
    var usuario = Auth.auth()
    var docRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textDescriptionVaga.alpha = 0.7
        self.buttonCadastrar.layer.cornerRadius = 10
        docRef = Database.database().reference()
        usuario.addStateDidChangeListener { (Auth, usuario) in
            if let usuarioLogado = usuario {
               self.docRef.child("empresa").child(usuarioLogado.uid).observe(DataEventType.value, with: { (dados) in
                    
                    if let valor = dados.value as? NSDictionary{
                        self.textNameEmpresa.text = (valor["Razao Social"] as? String)!
                    }
                })
            }else {
                print("usuario nao logado")
            }
        }
    }
    @IBAction func buttonCadastrarVaga(_ sender: Any) {
        var docRef: DatabaseReference!
        docRef = Database.database().reference()
        
        let dadosVaga = ["titulo" : textTituloVaga.text, "descricao" : textDescriptionVaga.text, "empresa" : textNameEmpresa.text]
        let result = docRef.child("vaga")
        result.child("\(String(describing: textTituloVaga.text!))+\(textNameEmpresa.text!)").setValue(dadosVaga)
        }
    
    @IBAction func buttonDismiss(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
