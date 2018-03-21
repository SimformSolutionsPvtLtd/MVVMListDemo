//
//  APIManager+Utility.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 16/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
extension APIManager {
    // MARK:- Error Handling
    func handleError(error:NSError?, failure:Failure, responseCode:Int?) -> Bool {
        if let httpError = error {
            let statusCode = httpError.code
            print("error code failure = \(statusCode)")

            // Internet connection problem
            if statusCode == -1009 || statusCode == -1001 || statusCode == -1003 {
                // no internet
            }
            else if statusCode == -999 {
                
            }
            else {
                // other error
            }
            return true
        }
        else if responseCode != nil && errorCodeList.contains(responseCode!) {
            return true
        }
        return false
    }
    
}
