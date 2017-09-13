//
//  TabelasNoticiasEmpresaViewController.swift
//  Instajob
//
//  Created by Diego William Crozare on 12/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

//import UIKit
//
//class TabelasNoticiasEmpresaViewController: UITableViewController {
//
//    var arrayNoticias: [NoticiasEmpresa] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        var noticiasEmpresa: NoticiasEmpresa
//        
//        noticiasEmpresa = NoticiasEmpresa(imagemNoticias: #imageLiteral(resourceName: "noticiasempresa1"))
//        arrayNoticias.append(noticiasEmpresa)
//    
//        noticiasEmpresa = NoticiasEmpresa(imagemNoticias: #imageLiteral(resourceName: "noticiasempresa2"))
//        arrayNoticias.append(noticiasEmpresa)
//    }
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrayNoticias.count
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let noticiasEmpresa: NoticiasEmpresa = arrayNoticias[ indexPath.row]
//        let celulaReusoNoticia = "celulaReusoNoticia"
//        let celulaNoticia = tableView.dequeueReusableCell(withIdentifier: celulaReusoNoticia, for: indexPath) as! NoticiasEmpresaViewController
//        celulaNoticia.imageView?.image = noticiasEmpresa.imagemNoticias
//        
//        return celulaNoticia
//    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 180
//    }
//    
//}
