//
//  vagasDetalhesCandidatoViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 21/10/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class vagasDetalhesCandidatoViewController: UIViewController {
    
    @IBOutlet weak var vagaCandidatoImage: UIImageView!
    @IBOutlet weak var vagaCandidatoTitulo: UILabel!
    @IBOutlet weak var vagaCandadidatoDescricao: UILabel!
    @IBOutlet weak var vagaCandidatoEmpresa: UILabel!
    @IBOutlet weak var buttonCandidatar: UIButton!
    @IBOutlet weak var buttonChat: UIButton!
    
    var nomeVagaEmpresa = ""
    
    var Vaga: Vagas!
    let usuario = Auth.auth()
    var id = ""
    var login:String = ""
    var name:String = ""

    var docRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        docRef = Database.database().reference()
        usuario.addStateDidChangeListener { (Auth, usuario) in
            if let usuarioLogado = usuario {
               self.id = usuarioLogado.uid
               self.docRef.child("candidato").child(usuarioLogado.uid).observe(DataEventType.value, with: { (dados) in
                    if let valor = dados.value as? NSDictionary{
                         self.login = valor["Login"] as! String
                         self.name = valor["Nome"] as! String
                    }
                })
                
            }else {
                print("usuario nao logado")
            }
        }
        infVaga()
        
        self.buttonChat.isEnabled = false
        self.buttonChat.alpha = 0
    }

    deinit {
        self.docRef.child("candidato").removeAllObservers()
    }
    
    @IBAction func buttonCandidatar(_ sender: Any) {
    
        let dataBase = Database.database().reference()
        let dadosVagaCandidato = ["nome" : self.name,
                                  "email" : self.login ]
        
        let vagaSelecionada: String = "\(Vaga.titulo!)+\(Vaga.empresa!)"
        
        let userEmpresa = dataBase.child("vaga").child(vagaSelecionada)
        userEmpresa.child("candidatos").child(self.id).setValue(dadosVagaCandidato)
        
        let alertaController = UIAlertController(title: "Sucesso", message: "seus dados foram salvos", preferredStyle: .alert)
        let alertaConfirmar = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertaController.addAction(alertaConfirmar)
        self.present(alertaController, animated: true, completion: nil)
        
        self.buttonCandidatar.isEnabled = false
        
        self.buttonChat.isEnabled = true
        self.buttonChat.alpha = 1
    }
    
    @IBAction func buttonChat(_ sender: Any) {

    }
    
    @IBAction func buttonCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func infVaga(){
        self.vagaCandidatoImage.image = Vaga.image
        self.vagaCandidatoTitulo.text = Vaga.titulo
        self.vagaCandadidatoDescricao.text = Vaga.descricao
        self.vagaCandidatoEmpresa.text = Vaga.empresa
    }
    
}
