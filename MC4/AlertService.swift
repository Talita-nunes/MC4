//
//  AlertService.swift
//  MC4
//
//  Created by Marcelo Perassi on 06/12/21.
//


import UIKit

class AlertService {
    
    func alert(message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dimiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        return alert
        
    }
}
