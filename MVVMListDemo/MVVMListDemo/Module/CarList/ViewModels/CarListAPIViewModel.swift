//
//  CarListAPIViewModel.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 17/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation

class CarListAPIViewModel: NSObject {
    var beforeComplition: (() -> Void)? = nil
    var Completion: ((BaseModel) -> Void)? = nil
    var Failure: ((String) -> Void)? = nil
    
    func callHideUnHideCompletion() -> Void {
        guard self.beforeComplition != nil else {
            return
        }
        self.beforeComplition!()
    }
    func callCompletion(response:BaseModel) -> Void {
        guard self.Completion != nil else {
            return
        }
        self.Completion!(response)
    }
    func callFailure(message:String) -> Void {
        guard self.Failure != nil else {
            return
        }
        self.Failure!(message)
    }
    func getCarList() -> Void {
        self.callHideUnHideCompletion()
        apiMgr.getAllCars(success: { (response) in
             self.callCompletion(response: response)
        }) { (message) -> (Void) in
            self.callFailure(message: message)
        }
    }
}
