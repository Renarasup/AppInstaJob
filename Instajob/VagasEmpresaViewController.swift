//
//  VagasEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase



class VagasEmpresaViewController: UIViewController {

    
    
    @IBOutlet weak var textTituloVaga: UITextField!
    @IBOutlet weak var textDescriptionVaga: UITextView!
    @IBOutlet weak var buttonCadastrar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textDescriptionVaga.alpha = 0.7
        self.buttonCadastrar.layer.cornerRadius = 10
    }


    @IBAction func buttonCadastrarVaga(_ sender: Any) {
        
        var docRef: DatabaseReference!
        docRef = Database.database().reference()
        
        let dadosVaga = ["titulo" : textTituloVaga.text, "descricao" : textDescriptionVaga.text]
        
        let timeStamp = Int(NSDate.timeIntervalSinceReferenceDate*1000)
        let result = docRef.child("vaga")
        result.child(String(timeStamp)).setValue(dadosVaga)
        
        }
    
    @IBAction func buttonDismiss(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
