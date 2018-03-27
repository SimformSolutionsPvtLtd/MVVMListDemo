//
//  Response.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 16/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
import ObjectMapper

class ResponseArray<T:Mappable> : Mappable {

    var msg : String?
    var status : Int?
    var result : [T]?
    required init?(map: Map) {

    }

    func mapping(map: Map) {
        msg <- map["statusText"]
        status <- map["status"]
        result <- map["result"]
    }

}
class ResponseObject<T:Mappable> : Mappable {

    var msg : String?
    var status : Int?
    var result : T?
    required init?(map: Map) {

    }

    func mapping(map: Map) {
        msg <- map["statusText"]
        status <- map["status"]
        result <- map["result"]
    }
    
}
