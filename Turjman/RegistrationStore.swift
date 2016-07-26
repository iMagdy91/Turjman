//
//  RegistrationStore.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/25/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class RegistrationStore {
    
    class func registerUserWithFirstName(firstName: String, company: String, phoneCode: String?, phone: String, email: String, password: String, countryID: String, iemeiNumber: String){
        
    }
    
    class func getCountriesListWithSuccess(success:([CountriesModel]?) -> Void, failure:(NSError?) -> Void){
    
        NetworkManager.performRequestWithPath(Network.countriesPath, requestMethod:.GET, parameters: nil, headers: nil, sucess: { (response) in
            
            let list: Array<CountriesModel> = Mapper<CountriesModel>().mapArray(response)!
            
            
            success(list)
            
            
        })
        { (error) in
            
            
        }
    }
    
}