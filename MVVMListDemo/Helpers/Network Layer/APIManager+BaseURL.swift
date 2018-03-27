//
//  APIManager+BaseURL.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 16/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
extension APIManager {

    func makeAppUrl(endpoint: APIEndPoints) -> String {
        // NB: include trailing slashes in APP URL strings!
        let url = "\(APIConstants.baseUrl)/\(endpoint.rawValue)"
        return url
    }

}
