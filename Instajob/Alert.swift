//
//  Alert.swift
//  testPersistencia
//
//  Created by Diego William Crozare on 24/06/2018.
//  Copyright © 2018 Diego William Crozare. All rights reserved.
//

import UIKit

class Alert {

   class func alert(_ title: String = String(), message: String, buttonTitle: String, viewController: UIViewController) {
        let alertaController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertaConfirmar = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertaController.addAction(alertaConfirmar)
        viewController.present(alertaController, animated: true, completion: nil)
    }
}
