//
//  JobsBusiness.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 24/06/2018.
//  Copyright © 2018 Diego William Crozare. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class JobsBusiness: NSObject {

    var provider = JobsProvider()
    
    func recoveryJobs(success: @escaping SuccessCalbackCompany, failure: @escaping FailureCallbackCompany) {
        provider.recoveryJobs(success: { (jobs) in
            success(jobs)
        }) { (error) in
            failure(error)
        }
    }
}
