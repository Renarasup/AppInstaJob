//
//  VagasDetalhesEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit


class VagasDetalhesEmpresaViewController: UITableViewController {

    
    var VagasAdd: [Vagas] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var vaga: Vagas
            vaga = Vagas(titulo: "Desenvolvedor Android", descricao: "5000,00", image:#imageLiteral(resourceName: "foto3x4"))
            VagasAdd.append(vaga)
        
            vaga = Vagas(titulo: "Desenvolvedor iOS", descricao: "tenha experiencia de 5 anos", image:#imageLiteral(resourceName: "foto3x4"))
            VagasAdd.append(vaga)
        
        
        
        
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
        //celula.textLabel?.text = Vagas.titulo
        //celula.imageView?.image = Vagas.image

            return celula
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalhesVagas" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let vagaSelecionada = self.VagasAdd [ indexPath.row ]
                let VC = segue.destination as! VagasDetalhesCelulaEmpresaViewController
                VC.Vaga = vagaSelecionada
                
            }
        }
    
    }
    
    
}
