//
//  JobsProvider.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 24/06/2018.
//  Copyright © 2018 Diego William Crozare. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

typealias SuccessCalbackCompany = (_ data: CompanyJobs) -> Void
typealias FailureCallbackCompany = (_ error: Error) -> Void

class JobsProvider: NSObject {

    var ref: DatabaseReference!
    
    func recoveryJobs(success: @escaping SuccessCalbackCompany, failure: @escaping FailureCallbackCompany) {
        ref = Database.database().reference()
        
        ref.child("vaga").observe(DataEventType.value) { (dados, erro) in
            if let valor = dados.value as? NSDictionary{
                for vagaAdd in valor.allKeys{
                    if let newValue = valor[vagaAdd] as? NSDictionary {
                        let titulo = newValue["titulo"] as? String
                        let descricao = newValue["descricao"] as? String
                        let empresa = newValue["empresa"] as? String
                        
                        let vagaNew = CompanyJobs(titulo: titulo!, descricao: descricao!, image: #imageLiteral(resourceName: "foto3x4"), empresa: empresa!)
                        success(vagaNew)
                    }
                }
            }else {
                failure(erro as! Error)
            }
        }
    }
}
