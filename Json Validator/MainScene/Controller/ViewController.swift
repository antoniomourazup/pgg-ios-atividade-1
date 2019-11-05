//
//  ViewController.swift
//  Json Validator
//
//  Created by zupper on 27/10/19.
//  Copyright © 2019 Risonaldo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var jsonTextField: UITextField!

    @IBAction func validateJsonWhenButtonIsTouchUpInside() {
        let textReceivedFromTextField: String! = jsonTextField.text
        if (!textReceivedFromTextField.isEmpty) {
        if(callFunctionValidateJson(textFromTextField:textReceivedFromTextField)){
                showAlertResult(title: "Resultado", message: "Json válido")
            } else {
                showAlertResult(title: "Resultado", message: "Json inválido")
            }
            jsonTextField.text = ""
        }
    }
    
    func callFunctionValidateJson(textFromTextField: String) -> Bool {
        let validate = Validate()
        return validate.initializeValidate(fromTextField: textFromTextField)
    }
    
    func showAlertResult(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK ", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}

