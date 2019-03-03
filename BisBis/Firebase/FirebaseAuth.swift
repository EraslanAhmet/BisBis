//
//  FirebaseAuth.swift
//  BisBis
//
//  Created by Yakup Ad on 3.03.2019.
//  Copyright © 2019 Yakup Ad. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseAuth {
    
    var authUser = User()
    var alert = Alert()

    func Login(email: String, password: String, completion: @escaping (Response) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if(error == nil) {
                if let FBUser = user {
                    self.authUser = User(
                        Id: FBUser.user.uid,
                        Email: FBUser.user.email!,
                        UserName: FBUser.user.displayName ?? "",
                        DisplayName: FBUser.user.displayName ?? "",
                        PhotoUrl: FBUser.user.photoURL?.absoluteString ?? "",
                        PhoneNumber: FBUser.user.phoneNumber ?? "",
                        IsEmailVerified: FBUser.user.isEmailVerified)
                    if(!self.authUser.IsEmailVerified){
                        self.alert = Alert(Title: "Hata",
                                            Message: "Email doğrulama yapılmadı. Lütfen posta kutunuza gönderilen onay mailini kontrol ediniz.",
                                            ButtonStyle: UIAlertAction.Style.cancel,
                                            ButtonTitle: "Tamam")
                        completion(Response(Data: self.authUser, Alert: self.alert))
                    }else{
                        self.alert = Alert(Title: "Başarılı",
                                            Message: "Kullanıcı Doğrulandı.",
                                            ButtonStyle: UIAlertAction.Style.default,
                                            ButtonTitle: "Tamam")
                        completion(Response(Data: self.authUser, Alert: self.alert))
                    }
                }
            } else {
                self.alert = Alert(Title: "Hata",
                                    Message: error?.localizedDescription ?? "An error occurred!",
                                    ButtonStyle: UIAlertAction.Style.cancel,
                                    ButtonTitle: "Tamam")
                completion(Response(Data: self.authUser, Alert: self.alert))
            }
        }
    }
    
    func Signup(email: String, password: String, completion: @escaping (Response) -> Void){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if(error == nil){
                if let FBUser = authResult {
                        self.authUser = User(
                            Id: FBUser.user.uid,
                            Email: FBUser.user.email!,
                            UserName: FBUser.user.displayName ?? "",
                            DisplayName: FBUser.user.displayName ?? "",
                            PhotoUrl: FBUser.user.photoURL?.absoluteString ?? "",
                            PhoneNumber: FBUser.user.phoneNumber ?? "",
                            IsEmailVerified: FBUser.user.isEmailVerified)
                    
                    self.SendEmailVerification(firebaseUser: FBUser, completion: {(returnData) in
                        completion(Response(Data: self.authUser, Alert: returnData))
                    })
                }
            }else{
                self.alert = Alert(Title: "Hata",
                                    Message: error?.localizedDescription ?? "An error occurred!",
                                    ButtonStyle: UIAlertAction.Style.cancel,
                                    ButtonTitle: "Tamam")
                completion(Response(Data: self.authUser, Alert: self.alert))
            }
        }
    }
    
    func SendEmailVerification(firebaseUser: AuthDataResult, completion: @escaping (Alert) -> Void) {
        firebaseUser.user.sendEmailVerification(completion: { (error) in
            if(error == nil){
                self.alert = Alert(Title: "Başarılı",
                                   Message: "Email Doğrulaması posta kutunuza gönderildi...",
                                   ButtonStyle: UIAlertAction.Style.default,
                                   ButtonTitle: "Tamam")
                completion(self.alert)
            }else{
                self.alert = Alert(Title: "Hata",
                                   Message: error?.localizedDescription ?? "An error occurred!",
                                   ButtonStyle: UIAlertAction.Style.cancel,
                                   ButtonTitle: "Tamam")
                completion(self.alert)
            }
        })
    }
    
    func ForgetPassword(email: String, completion: @escaping (Alert) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if(error == nil){
                self.alert = Alert(Title: "Başarılı",
                                   Message: "Şifreniz sıfırlandı. E-posta kutunuzu kontrol ediniz...",
                                   ButtonStyle: UIAlertAction.Style.default,
                                   ButtonTitle: "Tamam")
                completion(self.alert)
            }else{
                self.alert = Alert(Title: "Hata",
                                   Message: error?.localizedDescription ?? "An error occurred!",
                                   ButtonStyle: UIAlertAction.Style.cancel,
                                   ButtonTitle: "Tamam")
                completion(self.alert)
            }
        }
    }
}
