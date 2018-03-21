//
//  CarListResponse.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 17/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
import ObjectMapper

class CarListResponse : BaseModel {

    // MARK:- Variables
    var message : String?
    var status : Bool?
    var cars : [Car]?
    
    override func mapping(map: Map) {
        message <- map["message"]
        cars <- map["result"]
        status <- map["status"]
    }
    
}

