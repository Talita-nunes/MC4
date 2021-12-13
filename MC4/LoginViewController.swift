//
//  LoginOpcao2.swift
//  MC4
//
//  Created by Marcelo Perassi on 03/12/21.
//

import UIKit



class LoginViewController: UITableViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    weak var usernameTextField: UITextField!
    weak var passwordTextField: UITextField!
    
    let alertService = AlertService()
    let networkingService = NetworkingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.keyboardDismissMode = .onDrag
    }
    
    func didTapLoginButton() {
        
        guard
            let username = usernameTextField.text,
            let password = passwordTextField.text
            else { return }
        
//        formDataRequest(username: username, password: password)
        
        jsonRequest(username: username, password: password)
    }
    
    func formDataRequest(username: String, password: String) {
        let parameters = ["username": username,
                          "password": password]
        
        networkingService.request(endpoint: "/login", parameters: parameters) { [weak self] (result) in
            
            switch result {
                
            case .success(let user): self?.performSegue(withIdentifier: "loginSegue", sender: user)
                
            case.failure(let error):
                
                guard let alert = self?.alertService.alert(message: error.localizedDescription) else { return }
                self?.present(alert, animated: true)
            }
        }
    }
    
    func jsonRequest(username:String, password: String) {
        
        let login = Login(username: username, password: password)
        
        networkingService.request(endpoint: "/login", loginObject: login) { [weak self] (result) in
            
            switch result {
                
            case .success(let user): self?.performSegue(withIdentifier: "loginSegue", sender: user)
                
            case.failure(let error):
                
                guard let alert = self?.alertService.alert(message: error.localizedDescription) else { return }
                self?.present(alert, animated: true)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let mainAppVC = segue.destination as? MainAppViewController, let user = sender as? User {
            
            mainAppVC.user = user
        }
    }
}
