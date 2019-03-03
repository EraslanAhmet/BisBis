//
//  ResponseModel.swift
//  BisBis
//
//  Created by Yakup Ad on 3.03.2019.
//  Copyright © 2019 Yakup Ad. All rights reserved.
//

import Foundation

class Response {
    let Data: Any
    let Alert: Alert
    
    init(Data: Any, Alert: Alert) {
        self.Data = Data
        self.Alert = Alert
    }
}
