//
//  User.swift
//  Hiyaka
//
//  Created by Maram Alghanoom on 22/12/2020.
//

import UIKit

class User {
    
    var userName: String
    var userId : String
    var userEmail : String
    var userPassWord : String
    var userPhone : Int
    
    
    init(id: String,email: String,pass: String, phone: Int, name: String) {
        self.userName = name
        self.userId = id
        self.userEmail = email
        self.userPassWord = pass
        self.userPhone = phone
    }
    
}
