//
//  BaseModel.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 16/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
class BaseModel: NSObject,Mappable {

    required init?(map: Map) {

    }

    override init() {

    }
    
    func mapping(map: Map) {
    }
    
}
