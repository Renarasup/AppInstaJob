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
    let searchController = UISearchController(searchResultsController: nil)
    var filtroVagas = [Vagas]()
    var ref: DatabaseReference!
    
    
    
    func filterContentForSearchText(searchText:String, scope: String = "All"){
        
        filtroVagas = array.filter({ (resultVaga) in
            return resultVaga.titulo.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        ref = Database.database().reference()
        
        
        ref.child("vaga").observe(DataEventType.value) { (dados, erro) in
            if let valor = dados.value as? NSDictionary{
                for vagaAdd in valor.allKeys{
                    if let newValue = valor[vagaAdd] as? NSDictionary {
                        let titulo = newValue["titulo"] as? String
                        let descricao = newValue["descricao"] as? String
                        let empresa = newValue["empresa"] as? String
                        
                        let vagaNew = Vagas(titulo: titulo!, descricao: descricao!, image: #imageLiteral(resourceName: "foto3x4"), empresa: empresa!)
                        self.array.append(vagaNew)
                    }
                }
                self.tableView.reloadData()
            }else{
                print("ocorreu um erro ao carregar dados")
            }
        }
        
    }
    
    deinit {
        ref.child("vaga").removeAllObservers()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive && searchController.searchBar.text != ""{
        
            return filtroVagas.count
        }
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! VagaCelula
        
        celula.imageEmpresa.layer.cornerRadius = 45
        celula.imageEmpresa.clipsToBounds = true
        
        var vagaResult: Vagas
        
        if searchController.isActive && searchController.searchBar.text != ""{
            
             vagaResult = filtroVagas[indexPath.row]
        }else{
             vagaResult = array[indexPath.row]
        }
            
            celula.tituloLabel.text = vagaResult.titulo
            celula.descricaoLabel.text = vagaResult.descricao
            celula.imageEmpresa.image = vagaResult.image
        
            return celula
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            if segue.identifier == "detalhesVagas" {

                if let indexPath = tableView.indexPathForSelectedRow {

                    var vagaSelecionada: Vagas
                    
                    
                    if searchController.isActive && searchController.searchBar.text != ""{
                        
                        vagaSelecionada = filtroVagas[indexPath.row]
                    }else{
                        vagaSelecionada = array[indexPath.row]
                    }
                    
                    let VC = segue.destination as! VagasDetalhesCelulaEmpresaViewController
                    VC.Vaga = vagaSelecionada
                }
            }
        }
}
extension VagasDetalhesEmpresaViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}
