//
//  SignupViewController.swift
//  BisBis
//
//  Created by Yakup Ad on 3.03.2019.
//  Copyright © 2019 Yakup Ad. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBOutlet weak var txtEmailField: UITextField!
    @IBOutlet weak var txtPasswordField: UITextField!
    @IBOutlet weak var txtPasswordConfirmField: UITextField!
    
    private var fbAuth = FirebaseAuth()
    private var alertHelper = AlertHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnSignup_TouchUpInside(_ sender: Any) {
        let email = txtEmailField.text!
        let password = txtPasswordField.text!
        let confirmPassword = txtPasswordConfirmField.text!
        
        if(password == confirmPassword){
            fbAuth.Signup(email: email, password: password, completion: {(returnData) in
                self.alertHelper.showAlert(alert: returnData.Alert, me: self)
            })
            
        }else{
            self.alertHelper.showAlert(alert: Alert(Title: "Hata", Message: "Girdiğiniz parolalar eşlememektedir. Lütfen kontrol ediniz.", ButtonStyle: UIAlertAction.Style.cancel, ButtonTitle: "Tamam"), me: self)
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
