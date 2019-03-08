//
//  Alert.swift
//  BisBis
//
//  Created by Yakup Ad on 3.03.2019.
//  Copyright © 2019 Yakup Ad. All rights reserved.
//

import Foundation
import UIKit

class AlertHelper {
    func showAlert(alert: Alert, me: UIViewController){
        let alertController = UIAlertController(title: alert.Title, message: alert.Message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: alert.ButtonTitle, style: alert.ButtonStyle, handler: nil)
        alertController.addAction(alertAction)
        me.present(alertController, animated: true, completion: nil)
    }
}
