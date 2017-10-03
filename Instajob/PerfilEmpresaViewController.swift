//
//  PerfilEmpresaViewController.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import CoreData

class PerfilEmpresaViewController: UIViewController {

    
    @IBOutlet weak var textRazaoSocial: UITextField!
    @IBOutlet weak var textCnpj: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = appDelegate.persistentContainer.viewContext
        
        
        
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        
        
        
        do {
            
            let usuarios = try contexto.fetch( requisicao )
            
                if usuarios.count > 0 {
            
                    for usuario in usuarios {
                    
                        let razaoSocial = (usuario as AnyObject).value(forKey: "razao_social")
                        let cnpj = (usuario as AnyObject).value(forKey: "cnpj")
                        
                        self.textRazaoSocial.text = (razaoSocial as! String)
                        self.textCnpj.text = (cnpj as! String)
                }
            }
            
        } catch  {
            print ("dados nao encontrados")
        }
    }

    @IBAction func salvarButton(_ sender: Any) {
    }
 
    @IBAction func fecharButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
