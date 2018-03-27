//
//  DateExtention.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 21/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
extension Date {

    func yearsFrom(_ date: Date) -> Int {
        return (Calendar.current as NSCalendar).components(.year, from: date, to: self, options: []).year!
    }

}
