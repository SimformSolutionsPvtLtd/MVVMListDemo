//
//  APIManager.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 16/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
import Alamofire
let apiMgr = APIManager.apiManager
public class APIManager {
    // static properties get lazy evaluation and dispatch_once_t for free
    struct Static {
        static let instance = APIManager()
    }

    // this is the Swift way to do singletons
    class var apiManager: APIManager {
        return Static.instance
    }

    // needed for session token persistence
    let userDefaults = UserDefaults.standard

    func clearSession() {
        // clear authorisation token here
    }
    
    // MARK: Error Code
    var errorCodeList = [400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,421,422,423,424,425,426,427,428,429,431,451,-1009,-1001]
    
    init() {
        
    }
}
