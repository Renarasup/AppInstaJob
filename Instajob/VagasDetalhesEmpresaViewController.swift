//
//  VagasDetalhesEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import CoreData


class VagasDetalhesEmpresaViewController: UITableViewController {
//    so usa com array e informacoes externas
//    var VagasAdd: [Vagas] = []
    
 
   
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 1
    
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let Vagas: Vagas = VagasAdd [ indexPath.row ]
       
        let celulaReuso = "celulaReuso"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! VagaCelula
        
        //usando array
        //celula.tituloLabel.text = Vagas.titulo
        //celula.imageEmpresa.image = Vagas.image
        //celula.descricaoLabel.text = Vagas.descricao
        
        celula.imageEmpresa.layer.cornerRadius = 45
        celula.imageEmpresa.clipsToBounds = true
        //celula.textLabel?.text = Vagas.titulo
        //celula.imageView?.image = Vagas.image
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = appDelegate.persistentContainer.viewContext
        
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Vaga")
        
        do {
            let vagas = try contexto.fetch( requisicao )
            
            if vagas.count > 0 {
                
                for vaga in vagas {
                    
                    let titulo = (vaga as AnyObject).value(forKey: "titulo")
                    let descricao = (vaga as AnyObject).value(forKey: "descricao")
                    
                    celula.tituloLabel.text = (titulo as! String)
                    celula.descricaoLabel.text = (descricao as! String)
                    celula.imageEmpresa.image = #imageLiteral(resourceName: "foto3x4")
                }
            }
            
        } catch  {
            print ("dados nao encontrados")
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
