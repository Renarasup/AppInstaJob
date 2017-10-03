//
//  RegisterEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import JMMaskTextField_Swift
import CoreData

class RegisterEmpresaViewController: UIViewController {

 
    
    @IBOutlet weak var textRazaoSocial: UITextField!
    @IBOutlet weak var textCnpj:JMMaskTextField!
    @IBOutlet weak var textCnpjRepeat: JMMaskTextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

 
    @IBAction func buttonCadastrarEmpresa(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = appDelegate.persistentContainer.viewContext
        
        let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: contexto)

        usuario.setValue(self.textRazaoSocial.text, forKey: "razao_social")
        usuario.setValue(self.textCnpj.text, forKey: "cnpj")
        
        
        do {
            try contexto.save()
            print("dado salvo com sucesso")
        } catch {
            print("algo deu errado")
        }
    }

    @IBAction func buttonDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
