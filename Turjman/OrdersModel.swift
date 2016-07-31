//
//  OrdersModel.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/31/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class OrdersModel: BaseModel {
    
    var statistics: Statistics?
    var order: [Order]?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        statistics <- map["statistics"]
        order <- map ["order"]

    }

    
}

class Statistics: BaseModel {
    
    var unpaid: String?
    var rejected: String?
    var pending: String?
    var inprogress: String?
    var completed: String?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        unpaid <- map["unpaid"]
        rejected <- map["rejected"]
        pending <- map["pending"]
        inprogress <- map["inprogrss"]
        completed <- map["completed"]

    }
}

class Order: BaseModel {
    
    var quotationID: String?
    var createdAt: String?
    var orderStatus: String?
    var sourceLanguage: String?
    var targetLanguage: String?
    var serviceType: String?
    var subjectMatter: String?
    var durationTime: String?
    var totalCount: String?
    var paymentStatus: String?
    var totalAmount: String?
    var payLater: String?
    var paymentInfo: [PaymentInfo]?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        quotationID <- map["quotation_id"]
        createdAt <- map["created_at"]
        orderStatus <- map["order_status"]
        sourceLanguage <- map["source_language"]
        targetLanguage <- map["target_language"]
        serviceType <- map["service_type"]
        subjectMatter <- map["subject_matter"]
        durationTime <- map["duration_time"]
        totalCount <- map["total_count"]
        paymentStatus <- map["payment_status"]
        totalAmount <- map["total_amount"]
        payLater <- map["pay_later"]
        paymentInfo <- map["2CO_payment_info"]

    }
}

class PaymentInfo: BaseModel {
    
    var postAction: String?
    var sid: String?
    var mode: String?
    var liType: String?
    var liName: String?
    var liDescription: String?
    var merchantOrderID: String?
    var liPrice: String?
    var cardHolderName: String?
    var streetAddress: String?
    var city: String?
    var country: String?
    var email: String?
    var phone: String?
    var receiptLink: String?
    var demo: String?
    
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        postAction <- map["post_action"]
        sid <- map["sid"]
        mode <- map["mode"]
        liType <- map["li_0_type"]
        liName <- map["li_0_name"]
        liDescription <- map["li_0_description"]
        merchantOrderID <- map["merchant_order_id"]
        liPrice <- map["li_0_price"]
        cardHolderName <- map["card_holder_name"]
        streetAddress <- map["street_address"]
        city <- map["city"]
        country <- map["country"]
        email <- map["email"]
        phone <- map["phone"]
        receiptLink <- map["x_receipt_link_url"]
        demo <- map["demo"]

    }
}




