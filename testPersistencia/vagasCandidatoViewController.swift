//
//  vagasCandidatoViewController.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 11/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit

class vagasCandidatoViewController: UITableViewController {

    
    var dados:[String] = ["Desenvolvedor Java","Desenvolvedor Ios"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
            let celulas = "celulas"
            let celula = tableView.dequeueReusableCell(withIdentifier: celulas, for: indexPath)
            celula.textLabel?.text = dados[indexPath.row]
            return celula
        
    }
    
    
}
