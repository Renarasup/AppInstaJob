//
//  CandidateBusiness.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 24/06/2018.
//  Copyright © 2018 Diego William Crozare. All rights reserved.
//

import UIKit

class CandidateBusiness: NSObject {

    let provider = CandidateProvider()

    
    func resetPassword(email: UITextField) {
        provider.resetPassword(email: email)
    }
    
    func loginCandidate(email: UITextField, password: UITextField) {
        provider.loginCandidate(email: email, password: password)
    }
}
