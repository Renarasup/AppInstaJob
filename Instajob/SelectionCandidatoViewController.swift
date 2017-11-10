//
//  SelectionCandidatoViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 06/11/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SelectionCandidatoViewController: UITableViewController {

    var arrayCandidatos:[InfoCandidato] = []
    
    var vaga: Vagas!
    var nameEmpresa: String = ""
    var nameTitulo: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameEmpresa = vaga.empresa
        self.nameTitulo = vaga.titulo
        
        self.carregarDados()
    }

   
    

    func carregarDados () {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child("vaga").child("\(nameTitulo)+\(nameEmpresa)").child("candidatos").observe(DataEventType.value) { (dados, erro) in
            if let valor = dados.value as? NSDictionary{
                for vagaAdd in valor.allKeys{
                   if let newValue = valor[vagaAdd] as? NSDictionary {

                        let email = newValue["email"] as? String
                        let nome = newValue["nome"] as? String

                        let vagaNew = InfoCandidato(email: email!, nome: nome!, foto: #imageLiteral(resourceName: "foto3x4"))
                        self.arrayCandidatos.append(vagaNew)
                   }
                }
                self.tableView.reloadData()
            }else{
                print("ocorreu um erro ao carregar dados")
            }
        }
    }

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return arrayCandidatos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! VagaCandidato
        
        celula.fotoCandidato.layer.cornerRadius = 45
        celula.fotoCandidato.clipsToBounds = true
        
        var candidatoResult: InfoCandidato
        
        candidatoResult = arrayCandidatos[indexPath.row]
        
        celula.nameCandidataoLabel.text = candidatoResult.nome
        celula.emailCandidatoLabel.text = candidatoResult.email
        celula.fotoCandidato.image = candidatoResult.foto
        
        return celula
    
    }
}
