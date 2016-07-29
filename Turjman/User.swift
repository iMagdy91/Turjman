//
//  User.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/28/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import Foundation

class User {
    
    var userID: Int?
    var isLoggedIn: Bool = false
    var loginModel: LoginModel? {
        set(newValue) {
            if let value = newValue {
                self.isLoggedIn = true
            }
            else{
               self.isLoggedIn = false
            }
        }
        get{
            return self.loginModel
        }
    }
    class var sharedInstance: User {
        struct Static {
            static let instance: User = User()
        }
        return Static.instance
    }
}