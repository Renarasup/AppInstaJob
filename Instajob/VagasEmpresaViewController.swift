//
//  VagasEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import CoreData
import Firebase



class VagasEmpresaViewController: UIViewController {

    
    
    @IBOutlet weak var textTituloVaga: UITextField!
    @IBOutlet weak var textDescriptionVaga: UITextView!
    
    var docRef: DocumentReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        docRef = Firestore.firestore().document("empresa/vaga")

    }


    @IBAction func buttonCadastrarVaga(_ sender: Any) {
        
                let dadosEmpresa = ["titulo" : textTituloVaga.text, "descricao" : textDescriptionVaga.text ]
        
                docRef.setData(dadosEmpresa) { (error) in
                    if error != nil {
                        print("ocorreu um erro")
                    }else {
                        print("dados salvos com sucesso")
                    }
                    
        }
        
    }

}
