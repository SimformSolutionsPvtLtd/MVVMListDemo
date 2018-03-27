//
//  APIManager+Constant.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 16/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
typealias Success = (_ result: AnyObject) -> (Void)
typealias Failure = (_ errorMessage:String) -> (Void)
extension APIManager
{
    public class APIConstants {
        
        // Base URL
        static let baseUrl: String                = Bundle.main.infoDictionary!["Base_URL"] as! String
        // Current API Version
        static let APIVersion: String             = "v1"
        
        
    }
    enum APIEndPoints : String{
        // API Endpoints
        case carListEndPoint      = "getCarss"
        case loginUserEndPoint    = "loginUser"
    }
}

// API Result enum
enum APIResult : NSInteger
{
    case APISuccess = 0,APIFail,APIError
}
