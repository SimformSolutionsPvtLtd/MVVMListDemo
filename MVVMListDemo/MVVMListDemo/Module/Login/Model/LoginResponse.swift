//
//  LoginResponse.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 20/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginResponse : BaseModel{
    
    var message : String?
    var status : Bool?
    var user : [String: AnyObject]?
    
    override func mapping(map: Map)
    {
        message <- map["message"]
        user <- map["result"]
        status <- map["status"]
    }
}
