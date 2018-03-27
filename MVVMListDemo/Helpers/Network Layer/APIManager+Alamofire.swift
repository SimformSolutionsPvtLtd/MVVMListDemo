//
//  APIManager+Alamofire.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 16/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
extension APIManager
{
    //MARK: - get car list
    func getAllCars(success:@escaping (_ result:CarListResponse) -> Void,failure:@escaping Failure)
    {
        let url = self.makeAppUrl(endpoint: APIEndPoints.carListEndPoint)
        Alamofire.request(url).responseObject(completionHandler: { (completion:DataResponse<CarListResponse>) in
            if !self.handleError(error: completion.result.error as NSError?, failure: failure, responseCode: (completion.response?.statusCode))
            {
                if (completion.result.value?.status)! {
                    success(completion.result.value!)
                }else{
                    if let msg = completion.result.value?.message{
                        failure(msg)
                    }
                }
                
            }
        })
    }
    
    //MARK: - login user
    func loginUser(param :[String: String] ,success:@escaping (_ result:LoginResponse) -> Void,failure:@escaping Failure)
    {
        let url = self.makeAppUrl(endpoint: APIEndPoints.loginUserEndPoint)
        Alamofire.request(url, method: .get, parameters: param, encoding: JSONEncoding(), headers: nil).responseObject(completionHandler: { (completion:DataResponse<LoginResponse>) in
            if !self.handleError(error: completion.result.error as NSError?, failure: failure, responseCode: (completion.response?.statusCode))
            {
                if (completion.result.value?.status)! {
                    success(completion.result.value!)
                }else{
                    if let msg = completion.result.value?.message{
                        failure(msg)
                    }
                }
            }
        })
    }
}
