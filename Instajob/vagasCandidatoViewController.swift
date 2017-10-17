//
//  vagasCandidatoViewController.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 11/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase

class vagasCandidatoViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso1"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! VagaCelula
        
        celula.imageEmpresa.layer.cornerRadius = 45
        celula.imageEmpresa.clipsToBounds = true

        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child("empresa/vaga").observe(DataEventType.value) { (dados, erro) in
            if  dados == dados {
                
                let valor = dados.value as? NSDictionary
                let titulo = valor?["titulo"] as? String
                let descricao = valor?["descricao"] as? String
                celula.tituloLabel.text = titulo
                celula.descricaoLabel.text = descricao
                celula.imageEmpresa.image = #imageLiteral(resourceName: "foto3x4")
                
            
            }else{
               print("ocorreu um erro")
            }
        }
        
        return celula
    }
   }
