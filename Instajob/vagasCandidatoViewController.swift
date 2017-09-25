//
//  vagasCandidatoViewController.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 11/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit

class vagasCandidatoViewController: UITableViewController {

    
    var VagasAdd: [Vagas] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VagasAdd.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Vagas: Vagas = VagasAdd [ indexPath.row ]
        
        let celulaReuso = "celulaReuso"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! VagaCelula
        celula.tituloLabel.text = Vagas.titulo
        celula.imageEmpresa.image = Vagas.image
        celula.descricaoLabel.text = Vagas.descricao
        
        
        celula.imageEmpresa.layer.cornerRadius = 45
        celula.imageEmpresa.clipsToBounds = true
//        celula.textLabel?.text = Vagas.titulo
//        celula.imageView?.image = Vagas.image
        
        return celula
        
    }
    
    
}
