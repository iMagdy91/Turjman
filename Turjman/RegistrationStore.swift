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
    
    class func registerUserWithFirstName(firstName: String, company: String, phoneCode: String?, phone: String, email: String, password: String, countryID: String, iemeiNumber: String, success:(Int) -> Void, failure:(NSError?) -> Void, businessFailure:(TurjmanError) -> Void){
        
        
        var dict = Dictionary<String, AnyObject>?()
        
        if let phone_code = phoneCode {
            dict  = ["first_name":firstName,
                     "company": company,
                     "phone_code": phone_code,
                     "phone": phone,
                     "email": email,
                     "password": password,
                     "country_id": countryID,
                     "iemi_number": iemeiNumber
            ]
        }
        else {
            dict  = ["first_name":firstName,
                     "company": company,
                     "phone": phone,
                     "email": email,
                     "password": password,
                     "country_id": countryID,
                     "iemi_number": iemeiNumber
            ]
        }
        
      
        
        NetworkManager.performRequestWithPath(Network.registerPath, requestMethod: .POST, parameters: dict, headers: nil, sucess: { (response) in
            if let responseID = response {
                let responseIdentifier = responseID as! Int
                
                if responseIdentifier == 0 {
                    let registrationError = TurjmanError()
                    registrationError.errorDescription = "Registration Failed"
                    businessFailure(registrationError)
                }
                else {
                    success(responseIdentifier)
                }
            }
            }) { (error) in
                failure(error)
        }

        
        
    }
    
    class func getCountriesListWithSuccess(success:([CountriesModel]?) -> Void, failure:(NSError?) -> Void){
    
        NetworkManager.performRequestWithPath(Network.countriesPath, requestMethod:.GET, parameters: nil, headers: nil, sucess: { (response) in
            
            let list: Array<CountriesModel> = Mapper<CountriesModel>().mapArray(response)!
            success(list)
            
        })
        { (error) in
           failure(error)
            
        }
    }
    
}