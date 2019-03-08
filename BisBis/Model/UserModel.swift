//
//  UserModel.swift
//  BisBis
//
//  Created by Yakup Ad on 3.03.2019.
//  Copyright © 2019 Yakup Ad. All rights reserved.
//

class User: Codable {
    var Id: String
    var Email: String
    var UserName: String
    var DisplayName: String
    var PhotoUrl: String
    var PhoneNumber: String
    var IsEmailVerified: Bool
    
    convenience init() {
        self.init(Id: "",
                  Email: "",
                  UserName: "",
                  DisplayName: "",
                  PhotoUrl: "",
                  PhoneNumber: "",
                  IsEmailVerified: false)
    }
    
    init(Id: String, Email: String, UserName: String, DisplayName: String, PhotoUrl: String, PhoneNumber: String, IsEmailVerified: Bool) {
        self.Id = Id
        self.Email = Email
        self.UserName = UserName
        self.DisplayName = DisplayName
        self.PhotoUrl = PhotoUrl
        self.PhoneNumber = PhoneNumber
        self.IsEmailVerified = IsEmailVerified
    }
}
