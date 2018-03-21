//
//  CarDetailVC.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 19/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
import UIKit
class CarDetailVC: UIViewController {

    // MARK:- IBOutlets
    @IBOutlet weak var imgContainerView: ImageSliderView!
    @IBOutlet weak var detailContainerView: CarSpecificationView!
    
    //MARK:- Variables
    var car : Car!
    var carSpecViewModel : CarSpecificationViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carSpecViewModel = CarSpecificationViewModel(withCar: self.car)
        detailContainerView.viewModel = carSpecViewModel
        imgContainerView.viewModel = carSpecViewModel
        carSpecViewModel.Name.bindAndFire { [unowned self] in self.title = $0 }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        detailContainerView.setData()
        imgContainerView.setUpImageScroller()
    }
    
}
