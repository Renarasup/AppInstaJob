//
//  VagasCandidatoViewController.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 11/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase

class VagasCandidatoViewController: UITableViewController {
    
    var array:[CompanyJobs] = []
    let searchController = UISearchController(searchResultsController: nil)
    var filtroVagas = [CompanyJobs]()
    var ref: DatabaseReference!
    var business = JobsBusiness()
    
    func filterContentForSearchText(searchText:String, scope: String = "All"){
        
        filtroVagas = array.filter({ (resultVaga) in
            return resultVaga.titulo.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        recoveryJobs()
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
        let celulaReuso = "celulaReuso1"
        let cell = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! VagaCompanyCell
        
        var company: CompanyJobs
        
        if searchController.isActive && searchController.searchBar.text != ""{
            company = filtroVagas[indexPath.row]
        }else{
            company = array[indexPath.row]
        }
        cell.company = company
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalhesVagasCandidato" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let vagaSelecionada: CompanyJobs
                
                if searchController.isActive && searchController.searchBar.text != ""{
                    vagaSelecionada = filtroVagas[indexPath.row]
                }else{
                    vagaSelecionada = array[indexPath.row]
                }
                
                let VC = segue.destination as! VagasDetalhesCandidatoViewController
                VC.Vaga = vagaSelecionada
                
            }
        }
    }
    
    func recoveryJobs() {
        business.recoveryJobs(success: { (jobs) in
            self.array.append(jobs)
        }) { (error) in
            //implement alert
        }
    }
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    deinit {
        ref.child("vaga").removeAllObservers()
    }
}

extension VagasCandidatoViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}
