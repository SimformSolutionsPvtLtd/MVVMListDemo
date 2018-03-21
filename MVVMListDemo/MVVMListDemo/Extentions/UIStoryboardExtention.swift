//
//  UIStoryboardExtention.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 19/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {

    /// Fetch view controller from storyboard with use of class type
    public func instantiateVC<T>(_ identifier: T.Type) -> T? {
        let storyboardID = String(describing: identifier)
        if let vc = instantiateViewController(withIdentifier: storyboardID) as? T {
            return vc
        } else {
            return nil
        }
    }
    
}


extension UIStoryboard {

    // MARK: - storyboard declaration -
    private static var carDetailStoryboard: UIStoryboard {
        return UIStoryboard(name: "CarDetail", bundle: Bundle.main)
    }
    private static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    private static var loginStoryboard: UIStoryboard {
        return UIStoryboard(name: "Login", bundle: Bundle.main)
    }
    
    // MARK:- CarList storyboard
    class func carListVC() -> CarListVC {
        return UIStoryboard.mainStoryboard.instantiateVC(CarListVC.self)!
    }
    
    // MARK:- CarDetail storyboard
    class func carDetailVC() -> CarDetailVC {
        return UIStoryboard.carDetailStoryboard.instantiateVC(CarDetailVC.self)!
    }
    
    // MARK:- Login storyboard
    class func loginVC() -> LoginVC {
        return UIStoryboard.loginStoryboard.instantiateVC(LoginVC.self)!
    }
    
    class func signUpVC() -> SignUpVC {
        return UIStoryboard.loginStoryboard.instantiateVC(SignUpVC.self)!
    }
    
    class func forgotPasswordVC() -> ForgotPasswordVC {
        return UIStoryboard.loginStoryboard.instantiateVC(ForgotPasswordVC.self)!
    }
    
}
