//
//  MainAppViewController.swift
//  MC4
//
//  Created by Marcelo Perassi on 07/12/21.
//

import Foundation
import UIKit

class MainAppViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = user?.name {
            
            label.text = "Welcome, \(name.capitalized)"
        }
    }
}
