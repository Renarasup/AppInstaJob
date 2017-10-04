//
//  VagasEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import CoreData



class VagasEmpresaViewController: UIViewController {


    @IBOutlet weak var textTituloVaga: UITextField!
    @IBOutlet weak var textDescriptionVaga: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func buttonCadastrarVaga(_ sender: Any) {
        
       let appDelegatee = UIApplication.shared.delegate as! AppDelegate
       let context  = appDelegatee.persistentContainer.viewContext
        
       let vaga = NSEntityDescription.insertNewObject(forEntityName: "Vaga", into: context)
        
       vaga.setValue(textTituloVaga.text, forKey: "titulo")
       vaga.setValue(textDescriptionVaga.text, forKey: "descricao")
        
        do {
            try context.save()
            print("dados salvos com sucesso")
        } catch {
            print("algo deu errado")
        }
    }

}
