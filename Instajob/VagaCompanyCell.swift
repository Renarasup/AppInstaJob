//
//  VagaCelula.swift
//  Instajob
//
//  Created by Diego Crozare on 24/09/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import Foundation
import UIKit

class VagaCompanyCell: UITableViewCell {
    
    @IBOutlet weak var imageEmpresa: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    var company: CompanyJobs? {
        didSet {
            setupCompany()
            setupLayout()
        }
    }
    
    func setupCompany() {
        self.tituloLabel.text = company?.titulo
        self.descricaoLabel.text = company?.descricao
        self.imageEmpresa.image = company?.image
    }
    
    func setupLayout() {
        self.imageEmpresa.layer.cornerRadius = 45
        self.imageEmpresa.clipsToBounds = true
    }
}
