//
//  CarSpecificationViewModel.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 19/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import UIKit

class CarSpecificationView: UIView {

    // MARK:- IBOutlets
    @IBOutlet weak var lblLength:UILabel!
    @IBOutlet weak var lblWidth:UILabel!
    @IBOutlet weak var lblHeight:UILabel!
    @IBOutlet weak var lblSeatingCapacity:UILabel!
    @IBOutlet weak var lblDisplacement:UILabel!
    @IBOutlet weak var lblMaxTorque:UILabel!
    @IBOutlet weak var lblMaxPower:UILabel!
    @IBOutlet weak var lblAlternateFuel:UILabel!
    @IBOutlet weak var lblWheels:UILabel!
    @IBOutlet weak var lblFrontBrakeType:UILabel!
    @IBOutlet weak var lblRearBrakeType:UILabel!
    @IBOutlet weak var lblCarName:UILabel!
    @IBOutlet weak var lblCarPrice:UILabel!
    @IBOutlet weak var lblDescription:UILabel!

    // MARK:- Variables
    var viewModel : CarSpecificationViewModel!

    override func awakeFromNib() {
        
    }
    
    func setData() {
        lblLength.text          = viewModel.specs.length
        lblWidth.text           = viewModel.specs.width
        lblHeight.text          = viewModel.specs.height
        lblSeatingCapacity.text = viewModel.specs.getSeatingCapacity()
        lblDisplacement.text    = viewModel.specs.displacement
        lblMaxTorque.text       = viewModel.specs.maxTorque
        lblMaxPower.text        = viewModel.specs.maxPower
        lblAlternateFuel.text   = viewModel.specs.alternateFuel?.getFualDetail()
        lblWheels.text          = viewModel.specs.wheels
        lblFrontBrakeType.text  = viewModel.specs.frontBrakeType?.rawValue
        lblRearBrakeType.text   = viewModel.specs.rearBrakeType?.rawValue
        viewModel.Name.bindAndFire { (value) in
            self.lblCarName.text = value
        }
        viewModel.Price.bindAndFire { (value) in
            self.lblCarPrice.text = value
        }
        lblDescription.text     = viewModel.car.details
    }
    
}
