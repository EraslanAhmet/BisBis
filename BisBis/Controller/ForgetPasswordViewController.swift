//
//  ForgetPasswordViewController.swift
//  BisBis
//
//  Created by Yakup Ad on 3.03.2019.
//  Copyright © 2019 Yakup Ad. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var txtForgetPasswordTxt: UITextField!
    
    private var fbAuth = FirebaseAuth()
    private var alertHelper = AlertHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnForgetPassword_TouchUpInside(_ sender: Any) {
        let email = txtForgetPasswordTxt.text!
        
        fbAuth.ForgetPassword(email: email) { (returnData) in
            self.alertHelper.showAlert(alert: returnData, me: self)
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
