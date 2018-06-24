//
//  VagaCandidatoCell.swift
//  Instajob
//
//  Created by Diego Crozare on 06/11/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import Foundation
import UIKit

class VagaCandidateCell: UITableViewCell  {
    
    @IBOutlet weak var nameCandidateLabel: UILabel!
    @IBOutlet weak var emailCandidatoLabel: UILabel!
    @IBOutlet weak var fotoCandidato: UIImageView!
    
    var candidate: InfoCandidato? {
        didSet {
            setupCandidate()
            setupLayout()
        }
    }
    
    func setupCandidate() {
        nameCandidateLabel.text = candidate?.nome
        emailCandidatoLabel.text = candidate?.email
        fotoCandidato.image = candidate?.foto
    }
    
    func setupLayout() {
        fotoCandidato.layer.cornerRadius = 45
        fotoCandidato.clipsToBounds = true
    }
}
