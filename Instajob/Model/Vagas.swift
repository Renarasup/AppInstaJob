//
//  Vagas.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import Foundation
import UIKit

class Vagas {
    
    
    var titulo: String!
    var descricao: String!
    var image: UIImage!
    var empresa: String!
    
    init(titulo: String, descricao: String, image: UIImage) {
        self.titulo = titulo
        self.descricao = descricao
        self.image = image
    }
    init(titulo: String, descricao: String, image: UIImage, empresa: String) {
        self.titulo = titulo
        self.descricao = descricao
        self.image = image
        self.empresa = empresa
    }
}
