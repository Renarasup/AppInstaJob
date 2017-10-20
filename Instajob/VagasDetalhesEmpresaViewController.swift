//
//  VagasDetalhesEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class VagasDetalhesEmpresaViewController: UITableViewController {
    
    var array:[Vagas] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        carregarDados()
       

    }
    func carregarDados () {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child("empresa/vaga").observe(DataEventType.value) { (dados, erro) in
            if let valor = dados.value as? NSDictionary{
                for vagaAdd in valor.allKeys{
                    if let newValue = valor[vagaAdd] as? NSDictionary {
                        let titulo = newValue["titulo"] as? String
                        let descricao = newValue["descricao"] as? String
                        
                        let vagaNew = Vagas(titulo: titulo!, descricao: descricao!, image: #imageLiteral(resourceName: "foto3x4"))
                        self.array.append(vagaNew)
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
        return array.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! VagaCelula
        
        celula.imageEmpresa.layer.cornerRadius = 45
        celula.imageEmpresa.clipsToBounds = true
        
        
            let umaVaga = array[indexPath.row]
            
            celula.tituloLabel.text = umaVaga.titulo
            celula.descricaoLabel.text = umaVaga.descricao
            celula.imageEmpresa.image = umaVaga.image
        
            return celula
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            if segue.identifier == "detalhesVagas" {

                if let indexPath = tableView.indexPathForSelectedRow {

                    let vagaSelecionada = self.array [ indexPath.row ]
                    let VC = segue.destination as! VagasDetalhesCelulaEmpresaViewController
                    VC.Vaga = vagaSelecionada

                }
            }
        }
}
