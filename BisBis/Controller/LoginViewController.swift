//
//  LoginViewController.swift
//  BisBis
//
//  Created by Yakup Ad on 3.03.2019.
//  Copyright © 2019 Yakup Ad. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtEmailField: UITextField!
    @IBOutlet weak var txtPasswordField: UITextField!
    
    private var fbAuth = FirebaseAuth()
    private var alertHelper = AlertHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func btnLogin_TouchUpInside(_ sender: Any) {
        let email = txtEmailField.text!
        let password = txtPasswordField.text!
        
        fbAuth.Login(email: email, password: password, completion: {(returnData) in
            self.alertHelper.showAlert(alert: returnData.Alert, me: self)
        })
        
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
