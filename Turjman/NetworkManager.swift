//
//  NetworkManager.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/25/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    class func performRequestWithPath(path: String,requestMethod: Alamofire.Method ,parameters: [String : AnyObject]?,headers: [String : String]?, sucess:(AnyObject?) -> Void, failure:(NSError) ->Void){
        
        let url = String(format: "%@%@", Network.baseURL,path)
        
        Alamofire.request(requestMethod, url, parameters: parameters, encoding: .URL, headers: headers)
        
            .responseJSON { (response) in
                
                switch response.result {
                    
                case .Success(_):
                    sucess(response.result.value)
                case .Failure(let error):
                    failure(error)
                }
                
        }
        
    }
    
}