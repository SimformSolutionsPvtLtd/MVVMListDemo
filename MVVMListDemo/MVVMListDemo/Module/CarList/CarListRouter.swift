//
//  CarListRouter.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 19/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
import UIKit
protocol CarDetailRoute {
    func openCarDetail(for car: Car)
}
extension CarDetailRoute where Self: UIViewController {
    func openCarDetail(for car: Car) {
        let carDetailVC = UIStoryboard.carDetailVC()
        carDetailVC.car = car
        self.navigationController?.pushViewController(carDetailVC, animated: true)
    }
}
