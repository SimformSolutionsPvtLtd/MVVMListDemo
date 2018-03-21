//
//  CarListCell.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 17/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import UIKit

class CarListCell: UITableViewCell {

    @IBOutlet var lblCarName: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var imgCar: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func configureCell(car : Car) {
        lblCarName.text = car.name
        lblPrice.text = car.price
        imgCar.kf.setImage(with: URL(string: car.img!.first!))
    }

}
