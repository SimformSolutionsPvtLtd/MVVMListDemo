//
//  LoginVC.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 19/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    // MARK:- Variables
    private var navigator: LoginNavigator!
    
    // MARK:- IBOutlets
    @IBOutlet weak var txtUserName: LoginTextField!
    @IBOutlet weak var txtPassword: LoginTextField!
    
    // MARK:- Action Methods
    @IBAction func btnLoginClicked(_ sender: Any) {
        self.dismissKeyboard()
        self.navigator.navigate(to: .loginCompleted)
    }
    
    @IBAction func btnSignUpClicked(_ sender: Any) {
        self.dismissKeyboard()
        navigator.navigate(to: .signup)
    }
    
    @IBAction func btnForgotPasswordClicked(_ sender: Any) {
        self.dismissKeyboard()
         navigator.navigate(to: .forgotPassword)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigator = LoginNavigator(navigationController: self.navigationController!)
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        self.title = "Login"
    }

}
