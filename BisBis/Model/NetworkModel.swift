//
//  NetworkModel.swift
//  BisBis
//
//  Created by Yakup Ad on 6.03.2019.
//  Copyright © 2019 Yakup Ad. All rights reserved.
//

import Foundation

class Network: Codable {
    let Company : Array<String>
    let Href : String
    let Id : String
    let Location : Location
    let Name : String

    init(Company: Array<String>, Href: String, Id: String, Location: Location, Name: String) {
        self.Company = Company
        self.Href = Href
        self.Id = Id
        self.Location = Location
        self.Name = Name
    }
}
