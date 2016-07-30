//
//  LoginModel.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/29/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginModel: BaseModel {
    
    var userID: String?
    var email: String?
    var password: String?
    var brandID: String?
    var firstName: String?
    var lastName: String?
    var countryID: String?
    var company: String?
    var phoneCode: String?
    var phone: String?
    var lang: String?
    var address: String?
    var companyID: String?
    var countryCode: String?
    var confirmation: String?
    var skipPayment: String?
    var pbID: String?
    var accountManagerID: String?
    var authenticatedByApp: String?
    var accountManagerData: String?
    
    override init() {
        super.init()
    }
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        userID <- map["id"]
        email <- map ["email"]
        password <- map["password"]
        brandID <- map["brand_id"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        countryID <- map["country_id"]
        company <- map["company"]
        phoneCode <- map["phone_code"]
        phone <- map["phone"]
        lang <- map["lang"]
        address <- map["address"]
        companyID <- map["company_id"]
        countryCode <- map["country_code"]
        confirmation <- map["confirmation"]
        skipPayment <- map["skip_payment"]
        pbID <- map["pb_id"]
        accountManagerID <- map["account_manager_id"]
        authenticatedByApp <- map["authenticated_by_app"]
        accountManagerData <- map["account_manager_data"]


    }
    
}