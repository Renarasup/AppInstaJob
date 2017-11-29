//
//  VagasDetalhesCelulaEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit

class VagasDetalhesCelulaEmpresaViewController: UIViewController {

    @IBOutlet weak var imageVaga: UIImageView!
    @IBOutlet weak var descricaoVaga: UILabel!
    @IBOutlet weak var tituloVaga: UILabel!
    @IBOutlet weak var empresaVaga: UILabel!
    @IBOutlet weak var finalizarButton: UIButton!
    @IBOutlet weak var candidatosButton: UIButton!
    
    var Vaga: Vagas!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalizarButton.layer.cornerRadius = 15
        candidatosButton.layer.cornerRadius = 15
        
        
        self.dados()
    }

    
    @IBAction func buttonDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonFinalizarVaga(_ sender: Any) {
    }
    
    @IBAction func buttonCandidatos(_ sender: Any) {
    }
    
    func dados() {
        self.empresaVaga.text = Vaga.empresa
        self.imageVaga.image = Vaga.image
        self.descricaoVaga.text = Vaga.descricao
        self.tituloVaga.text = Vaga.titulo
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalhesCandidatos" {
            
                let VC = segue.destination as! SelectionCandidatoViewController
                VC.vaga = self.Vaga
            }
        }
}
