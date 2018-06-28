//
//  VagasDetalhesCandidatoViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 21/10/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class VagasDetalhesCandidatoViewController: UIViewController {
    
    @IBOutlet weak var vagaCandidatoImage: UIImageView!
    @IBOutlet weak var vagaCandidatoTitulo: UILabel!
    @IBOutlet weak var vagaCandadidatoDescricao: UILabel!
    @IBOutlet weak var vagaCandidatoEmpresa: UILabel!
    @IBOutlet weak var buttonCandidatar: UIButton!
    @IBOutlet weak var buttonChat: UIButton!
    
    
    var nomeVagaEmpresa = ""
    var business = JobsBusiness()
    var vaga: CompanyJobs!
    let usuario = Auth.auth()
    var id = ""
    var login:String = ""
    var name:String = ""
    
    var docRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
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
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        infVaga()
    }
    
    deinit {
        self.docRef.child("candidato").removeAllObservers()
    }
    
    @IBAction func buttonCandidatar(_ sender: Any) {
        applyJob()
        Alert.alert(message: "seus dados foram salvos", buttonTitle: "OK", viewController: self)
        setupLayoutButton()
    }
    
    @IBAction func buttonChat(_ sender: Any) {
        
    }
    
    @IBAction func buttonCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func infVaga(){
        self.vagaCandidatoImage.image = vaga.image
        self.vagaCandidatoTitulo.text = vaga.titulo
        self.vagaCandadidatoDescricao.text = vaga.descricao
        self.vagaCandidatoEmpresa.text = vaga.empresa
    }
    
    func applyJob() {
        let dadosCandidato = ["nome" : self.name, "email" : self.login ]
        let vagaSelecionada: String = "\(vaga.titulo!)+\(vaga.empresa!)"
        
        business.applyJobs(dataJobCandidate: dadosCandidato, jobSelected: vagaSelecionada, id: self.id)
    }
    
    func setupLayoutButton() {
        self.buttonCandidatar.isEnabled = false
        self.buttonChat.isEnabled = true
        self.buttonChat.alpha = 1
    }
    
    func setupLayout() {
        buttonCandidatar.layer.cornerRadius = 15
        buttonChat.layer.cornerRadius = 15
        buttonChat.isEnabled = false
        buttonChat.alpha = 0
    }
}
