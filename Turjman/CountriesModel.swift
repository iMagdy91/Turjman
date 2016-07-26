//
//  CountriesModel.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/26/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class CountriesModel: BaseModel {
    
    var countryID: String?
    var countryName: String?
    var telephoneCode: String?
    
    required init?(_ map: Map) {
       super.init(map)
    }
    
    override func mapping(map: Map) {
        countryID <- map["country_id"]
        countryName <- map ["country_name"]
        telephoneCode <- map["telephone_code"]
    }
    
}