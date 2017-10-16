//
//  VagasDetalhesEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import Firebase


class VagasDetalhesEmpresaViewController: UITableViewController {
    
    var docRef: DocumentReference!
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 2
    
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let celulaReuso = "celulaReuso"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! VagaCelula
        
        
        celula.imageEmpresa.layer.cornerRadius = 45
        celula.imageEmpresa.clipsToBounds = true
        
        let vagaEmpresa = Firestore.firestore().collection("empresa").document("vaga")

        vagaEmpresa.getDocument { (document, erro) in
            if let document = document {
                print ("Document data: \(document.data())")
            }else {
                print("dados nao existem")
            }
            
            
//            celula.tituloLabel.text = vagaTitulo
//            celula.descricaoLabel.text = vagaDescricao
        }
        
    
            return celula
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "detalhesVagas" {
//            
//            if let indexPath = tableView.indexPathForSelectedRow {
//                
//            //    let vagaSelecionada = self.VagasAdd [ indexPath.row ]
//                let VC = segue.destination as! VagasDetalhesCelulaEmpresaViewController
//            //   VC.Vaga = vagaSelecionada
//                
//            }
//        }
//    }
}
