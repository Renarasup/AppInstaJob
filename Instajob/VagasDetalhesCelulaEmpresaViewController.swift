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
    
    
    var Vaga: Vagas!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageVaga.image = Vaga.image
        descricaoVaga.text = Vaga.descricao
        tituloVaga.text = Vaga.titulo
  
    }

    @IBAction func buttonFinalizarVaga(_ sender: Any) {
    }
   
    
    @IBAction func buttonDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
