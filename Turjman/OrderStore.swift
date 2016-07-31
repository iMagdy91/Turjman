//
//  OrderStore.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/31/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class OrderStore {
 
    class func getOrderListWithSuccess(success:(OrdersModel?) -> Void, failure:(NSError?) -> Void) {
        var dict = Dictionary<String, AnyObject>?()
        
        dict = ["client_id": User.sharedInstance.userData.userID!,
                "language_code": "en"]
        
        NetworkManager.performRequestWithPath(Network.ordersPath, requestMethod: .POST, parameters: dict, headers: nil, success: { (response) in
            let model = Mapper<OrdersModel>().map(response)
            success(model)
        }) { (error) in
            failure(error)
        }
    }
    
}