//
//  vagasCandidatoViewController.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 11/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import CoreData

class vagasCandidatoViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso1"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! VagaCelula
        
        celula.imageEmpresa.layer.cornerRadius = 45
        celula.imageEmpresa.clipsToBounds = true

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
   }
