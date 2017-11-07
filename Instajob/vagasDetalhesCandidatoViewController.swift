//
//  vagasDetalhesCandidatoViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 21/10/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import FirebaseDatabase

class vagasDetalhesCandidatoViewController: UIViewController {
    
    @IBOutlet weak var vagaCandidatoImage: UIImageView!
    @IBOutlet weak var vagaCandidatoTitulo: UILabel!
    @IBOutlet weak var vagaCandadidatoDescricao: UILabel!
    @IBOutlet weak var vagaCandidatoEmpresa: UILabel!
    
    let nome = "Diego William Crozare"
    let email = "crozare.crozare@hotmail.com"
    var nomeVagaEmpresa = ""
    
    var Vaga: Vagas!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        infVaga()
    }

    @IBAction func buttonCandidatar(_ sender: Any) {
        
        let dataBase = Database.database().reference()
        let dadosVagaCandidato = ["nome" : nome,
                                  "email" : email ]
        
        let userEmpresa = dataBase.child("vaga").child("530830683750")
        userEmpresa.child("candidatos").child("001").setValue(dadosVagaCandidato)
        
        let alertaController = UIAlertController(title: "Sucesso", message: "seus dados foram salvos", preferredStyle: .alert)
        let alertaConfirmar = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertaController.addAction(alertaConfirmar)
        self.present(alertaController, animated: true, completion: nil)
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
