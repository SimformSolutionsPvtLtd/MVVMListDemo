//
//  TJButton.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 21/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import UIKit

@IBDesignable class LoginButton: UIButton {

     // MARK: - Inspectables
    @IBInspectable var bgColor: UIColor = UIColor.appBlue {
        didSet {
            self.backgroundColor = bgColor
        }
    }

    @IBInspectable var titleColor: UIColor = UIColor.white {
        didSet {
            self.setTitleColor(titleColor, for: .normal)
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    // MARK: - View
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        // set background color
        self.backgroundColor = bgColor
        
        // set corner radious
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true

        // set capital title
        self.setTitle(self.titleLabel?.text!.capitalized , for: .normal)

        // set title color and font
        self.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        self.titleLabel?.textColor = titleColor
        self.setTitleColor(titleColor, for: .normal)
        
        // update UI
        self.setNeedsLayout()
        self.setNeedsDisplay()
    }

    override func draw(_ rect: CGRect) {
        
    }
    
}
