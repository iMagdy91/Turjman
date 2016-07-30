//
//  User.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/28/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import Foundation

class User {
    
    var isLoggedIn: Bool = false
    var userData: LoginModel = LoginModel()

    class var sharedInstance: User {
        struct Static {
            static let instance: User = User()
        }
        return Static.instance
    }
}