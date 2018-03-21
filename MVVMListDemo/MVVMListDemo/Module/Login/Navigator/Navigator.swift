//
//  Navigator.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 19/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
import UIKit
protocol Navigator {
    associatedtype Destination
    func navigate(to destination: Destination)
}

class LoginNavigator: Navigator {
    // Here we define a set of supported destinations using an
    // enum, and we can also use associated values to add support
    // for passing arguments from one screen to another.
    enum Destination {
        case loginCompleted
        case forgotPassword
        case signup
    }
    // In most cases it's totally safe to make this a strong
    // reference, but in some situations it could end up
    // causing a retain cycle, so better be safe than sorry :)
    private weak var navigationController: UINavigationController?
    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Navigator
    func navigate(to destination: Destination) {
        let viewController = makeViewController(for: destination)
        switch destination {
        case .loginCompleted:
            AppDelegate.shared.window?.switchRootViewController(viewController, withNavigation: true)
        default:
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    // MARK: - Private
    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .loginCompleted:
            return UIStoryboard.carListVC()
        case .forgotPassword:
            return UIStoryboard.forgotPasswordVC()
        case .signup:
            return UIStoryboard.signUpVC()
        }
    }
    
}

