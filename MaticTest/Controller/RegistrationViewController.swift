//
//  RegistrationViewController.swift
//  MaticTest
//
//  Created by Sourav on 30/07/19.
//  Copyright © 2019 matic. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registrationClicked(_ sender: Any) {
        
        guard let username = usernameTextField.text?.trimmingCharacters(in: .whitespaces), username != "" else {
            return
        }
        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespaces), password != "" else {
            return
        }
        
        let userDetailKey = "\(username)-\(password)"
        let encryptedkey = encryptKey(userDetail: userDetailKey)
        
        KeychainService.saveUserDetails(uname: usernameTextField.text!, password: passwordTextField.text!, token: encryptedkey) { (success, message) in
            if !success {
                Helper.showAlert(title: "Error", subtitle: message)
                return
            }
            
            UserDetail.sharedInstance.updateUserDetail(username: username, userKey: userDetailKey)
            
            let homeViewController = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
            self.navigationController?.pushViewController(homeViewController!, animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
