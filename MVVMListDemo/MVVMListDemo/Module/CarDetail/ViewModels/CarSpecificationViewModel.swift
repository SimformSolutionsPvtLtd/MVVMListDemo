//
//  CarSpecificationViewModel.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 20/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation

class CarSpecificationViewModel: NSObject,CarProtocol {

    var car : Car!
    var specs : Spec!
    var Name: Dynamic<String>
    var Price: Dynamic<String>

    init(withCar car : Car ) {
        self.car   = car
        self.specs = car.specs!
        self.Name  = Dynamic(car.name!)
        self.Price = Dynamic(car.price!)
    }
}

protocol CarProtocol {
    var Name: Dynamic<String> { get }
    var Price: Dynamic<String> { get }
}
