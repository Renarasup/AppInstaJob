//
//  PerfilEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//
import UIKit
import FirebaseAuth
import FirebaseDatabase

class PerfilEmpresaViewController: UIViewController {
    
    @IBOutlet weak var textRazaoSocial: UITextField!
    @IBOutlet weak var textCnpj: UITextField!
    @IBOutlet weak var textCidade: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textSenha: UITextField!
    @IBOutlet weak var buttonSalvar: UIButton!
    @IBOutlet weak var buttonFechar: UIButton!
    
    let user = LoginEmpresaViewController()
    var docRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        recoveryInfoCompany()
    }
    
    
    
    @IBAction func salvarButton(_ sender: Any) {
    }
    
    @IBAction func fecharButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupLayout() {
        self.buttonSalvar.layer.cornerRadius = 10
        self.buttonFechar.layer.cornerRadius = 10
    }
    
    func recoveryInfoCompany() {
        docRef = Database.database().reference()
        
        user.usuario.addStateDidChangeListener { (Auth, usuario) in
            if let usuarioLogado = usuario {
                self.docRef.child("empresa").child(usuarioLogado.uid).observe(DataEventType.value, with: { (dados) in
                    
                    if let valor = dados.value as? NSDictionary{
                        self.textRazaoSocial.text = valor["Razao Social"] as? String
                        self.textCnpj.text = valor["CNPJ"] as? String
                        self.textCidade.text = valor["Cidade"] as? String
                        self.textEmail.text = valor["Email"] as? String
                        self.textSenha.text = valor["Senha"] as? String
                    }
                })
                
            }else {
                print("usuario nao logado")
            }
        }
    }
    
    deinit {
        self.docRef.child("empresa").removeAllObservers()
    }
    
}
