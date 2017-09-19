//
//  NoticiasCandidatoViewController.swift
//  Instajob
//
//  Created by Diego William Crozare on 13/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit

class NoticiasCandidatoViewController: UIViewController {

    @IBOutlet weak var imgPerfil: UIImageView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

            imgPerfil.layer.cornerRadius = 42
            imgPerfil.clipsToBounds = true
//        noticia1.layer.cornerRadius = 8
//        noticia2.layer.cornerRadius = 8
//        noticia3.layer.cornerRadius = 8
        
        
    }
//
//    @IBAction func buttonCancel(_ sender: Any) {
//        
//        dismiss(animated: true, completion: nil)
//    }
    

}
