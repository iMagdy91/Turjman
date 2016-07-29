//
//  LoginStore.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/29/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import Foundation

class LoginStore {
    class func loginWithEmail(mail:String,password:String) {
        var dict = Dictionary<String, AnyObject>?()
        
        dict = ["email": mail,
                "password": password,
                "iemi_number": Device.udid]
        
        NetworkManager.performRequestWithPath(Network.loginPath, requestMethod: .POST, parameters: dict, headers: nil, success: { (response) in
            let result = response?.description
            }) { (error) in
                
        }
    }
}