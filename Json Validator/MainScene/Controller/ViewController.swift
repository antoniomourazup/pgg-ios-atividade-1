//
//  ViewController.swift
//  Json Validator
//
//  Created by zupper on 27/10/19.
//  Copyright © 2019 Risonaldo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var jsonTextFiel: UITextField?
    
    let BUTTON_OK = "OK"
    
    let responsevalid = ["Resultado", "Json válido"]
    let responseInvalid = ["Resultado", "Json inválido"]

    @IBAction func validarBtn() {
        
        if(jsonTextFiel?.text != ""){
            guard let textReceived = jsonTextFiel?.text else{return}
            
            let json = JsonData(stringJso: textReceived)

            if(validaJson(s:json.stringJson)){
                callAlert(bool: true)
            }
            else{
                callAlert(bool: false)
            }
        }
    }
    
    func validaJson(s: String) -> Bool{
        let process = ProcessJson(stringJson: s)
        return process.mainClass()
    }
    
    func callAlert(bool: Bool){
        
        if(bool){
            showAlert(title: responsevalid[0], message: responsevalid[1])
        }
        else{
            showAlert(title: responseInvalid[0], message: responseInvalid[1])
        }
        
        jsonTextFiel?.text = ""
    }
    
    func showAlert(title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: BUTTON_OK, style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        
    }

}

