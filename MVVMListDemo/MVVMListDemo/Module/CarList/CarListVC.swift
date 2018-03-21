//
//  CarListVC.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 17/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation
import UIKit
class CarListVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView:UITableView!

    // MARK: - Variables
    var settingDataSource:TableViewDataModel!
    var tableviewDidSelecteAtIndexPath : TableViewDataModel.didSelectItemAtIndex!
    var tableviewViewCellConfigure:TableViewDataModel.tableviewCellConfiguration!
    var tableviewViewheightForItem : TableViewDataModel.heightForRowAtIndex!
    var cars = [Car]()
    var serviceCallingModel:CarListAPIViewModel = CarListAPIViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiParsingClosers()
        self.tableViewClouser()
        self.initialiaseTableModel()
        self.serviceCallingModel.getCarList()
    }
    
    // MARK:- setup api closers
    func apiParsingClosers() {
        serviceCallingModel.beforeComplition = { () -> () in
            // Hide indicator
        }
        serviceCallingModel.Completion = {(respose) -> () in
            // Hide indicator
            if let carRes = respose as? CarListResponse {
                guard carRes.cars != nil else {
                    return
                }
                self.cars = carRes.cars!
                self.initialiaseTableModel()
            }
        }
        serviceCallingModel.Failure = {(meesage) -> () in
            // Hide indicator
            // show alert with this message -> meesage
        }
    }
    
    // MARK:- initialise table model
    func initialiaseTableModel() -> Void {
        if self.settingDataSource == nil {
            self.settingDataSource = TableViewDataModel.init(items: [cars] as [[AnyObject]],
                                                             forTableView: self.tableView,
                                                             withConfigureCell: self.tableviewViewCellConfigure,
                                                             withSizeForItem: self.tableviewViewheightForItem,
                                                             withDidSelection: self.tableviewDidSelecteAtIndexPath,
                                                             withCellIdentifier: [CellIdentifier.carListCell],
                                                             withEstimateHeight: [120])
            self.tableView.dataSource = self.settingDataSource
            self.tableView.delegate = self.settingDataSource
        } else {
            self.settingDataSource.updateTableView(items: [cars] as [[AnyObject]])
        }
        DispatchQueue.main.async {
           self.tableView.reloadData()
        }
    }
    
    // MARK:- setup table closers
    func tableViewClouser() -> Void {
        self.tableviewViewCellConfigure = {(cell,item,indexPath) -> Void in
            guard let carListCell = cell as? CarListCell, let car = item as? Car else{
                return
            }
            carListCell.configureCell(car: car)
        }
        self.tableviewViewheightForItem = {(tablview,indexPath) -> CGFloat in
            return 160
        }
        self.tableviewDidSelecteAtIndexPath = {(tableview,indexPath,item) -> Void in
            self.openCarDetail(for: self.cars[indexPath.row])
        }
    }

}
extension CarListVC : CarDetailRoute {
    
}
