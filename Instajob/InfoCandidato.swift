//
//  InfoCandidato.swift
//  Instajob
//
//  Created by Diego Crozare on 06/11/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import Foundation
import UIKit


class InfoCandidato {
    
    var email: String!
    var nome: String!
    var foto: UIImage!
    
    init(email: String, nome: String, foto: UIImage ) {
        self.email = email
        self.nome = nome
        self.foto = foto
    }
    
    
}
