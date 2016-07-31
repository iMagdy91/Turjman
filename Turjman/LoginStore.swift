//
//  LoginStore.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/29/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginStore {
    class func loginWithEmail(mail:String,password:String,success:(LoginModel?)-> Void,failure:(NSError?)-> Void) {
        var dict = Dictionary<String, AnyObject>?()
        
        dict = ["email": mail,
                "password": password,
                "iemi_number": Device.udid]
        
        NetworkManager.performRequestWithPath(Network.loginPath, requestMethod: .POST, parameters: dict, headers: nil, success: { (response) in
            let model = Mapper<LoginModel>().map(response)
            success(model)
            }) { (error) in
                failure(error)
        }
    }
}