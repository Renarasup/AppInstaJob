//
//  vagasDetalhesCandidatoViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 21/10/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit

class vagasDetalhesCandidatoViewController: UIViewController {
    
    @IBOutlet weak var vagaCandidatoImage: UIImageView!
    @IBOutlet weak var vagaCandidatoTitulo: UILabel!
    @IBOutlet weak var vagaCandadidatoDescricao: UILabel!
    
    
    var Vaga: Vagas!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vagaCandidatoImage.image = Vaga.image
        vagaCandidatoTitulo.text = Vaga.titulo
        vagaCandadidatoDescricao.text = Vaga.descricao
      
    }

    @IBAction func buttonCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
