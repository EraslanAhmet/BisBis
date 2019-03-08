//
//  Alert.swift
//  BisBis
//
//  Created by Yakup Ad on 3.03.2019.
//  Copyright © 2019 Yakup Ad. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    let Title: String
    let Message: String
    let ButtonStyle: UIAlertAction.Style
    let ButtonTitle: String
    
    convenience init() {
        self.init(Title: "",
                  Message: "",
                  ButtonStyle: UIAlertAction.Style.default,
                  ButtonTitle: "")
    }
    
    init(Title: String, Message: String, ButtonStyle: UIAlertAction.Style, ButtonTitle: String) {
        self.Title = Title
        self.Message = Message
        self.ButtonStyle = ButtonStyle
        self.ButtonTitle = ButtonTitle
    }
}

