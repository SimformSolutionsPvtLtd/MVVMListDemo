//
//  UIWindowExtention.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 21/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
import UIKit
extension UIWindow {

    func switchRootViewController(_ viewController: UIViewController, withNavigation : Bool,   animated: Bool = true, duration: TimeInterval = 0.5, options: UIViewAnimationOptions = .transitionFlipFromRight, completion: (() -> Void)? = nil) {
        guard animated else {
            rootViewController = viewController
            return
        }
        
        UIView.transition(with: self, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            if withNavigation {
                let navigation = UINavigationController(rootViewController: viewController)
                self.rootViewController = navigation
            } else {
                self.rootViewController = viewController
            }
            UIView.setAnimationsEnabled(oldState)
        }) { _ in
            completion?()
        }
    }
    
}
