//
//  TableViewDataModel.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 17/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import UIKit
let kByDefaultCellWidth = 50
let kByDefaultCellheight = 50
class TableViewDataModel: NSObject,UITableViewDataSource,UITableViewDelegate {

    var tableview: UITableView!
    var cellIdentifier:[String]!
    var items: [[AnyObject]]!
    var numberOfSection = 1
    var estimateHeight:[CGFloat] = [44]
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    var defaultCellSize: CGSize = CGSize(width: kByDefaultCellWidth, height: kByDefaultCellheight)
    
    var tablwViewDidSelectAtIndexPath: didSelectItemAtIndex!
    var configureCellBlock:tableviewCellConfiguration?
    var paginationBlock : paginationCallBack?
    var SizeForItem: heightForRowAtIndex?
    var headerViewBlock: headerViewForSection?
    var heightForHeader: heightForHeaderInSection?
    var canEditRow: canEditRowAt?
    var editActionForRow:editActionsForRowAt?
    var resueIdentifire:reuseIdentifierForItem?
    var refreshHandler:refreshHandler?
    //Complition block
    typealias tableviewCellConfiguration = (_ tablViewCell:UITableViewCell, _ item: AnyObject, _ indexPath:IndexPath) -> ()
    typealias paginationCallBack = ((_ index : Int) -> ())!
    typealias heightForRowAtIndex = ((_ tablView: UITableView,_ itemIndexPath: IndexPath) -> (CGFloat))!
    typealias didSelectItemAtIndex = ((_ tablView: UITableView, _ itemIndexPath: IndexPath, _ modelObject: AnyObject) -> (Void))!
    typealias headerViewForSection = ((_ tblView: UITableView, _ section: Int) -> (UIView))!
    typealias  heightForHeaderInSection = ((_ tblView: UITableView, _ section: Int) -> (CGFloat))!
    typealias canEditRowAt = ((_ tbleView:UITableView,_ indexPath:IndexPath) -> (Bool))!
    typealias editActionsForRowAt = ((_ tblView:UITableView,_ indexPath:IndexPath) -> ([UITableViewRowAction]))!
    typealias reuseIdentifierForItem = ((IndexPath,AnyObject) -> String)!
    typealias refreshHandler = ((UIRefreshControl) -> Void)!
    init(items anItems:[[AnyObject]]!, forTableView aTableView: UITableView!,withConfigureCell aConfigureCell:@escaping tableviewCellConfiguration,withSizeForItem aSizeForItem:heightForRowAtIndex = nil,withPagination aPagination:paginationCallBack = nil,withDidSelection aDidSelectRow:didSelectItemAtIndex = nil, withCellIdentifier aCellIdentifier:[String]!,isCellXib:Bool = false,numberOfSection aNoOfSec:Int = 1,withEstimateHeight aEstimateHeight:[CGFloat] = [44],withTableViewheader aHeaderViewForSection:headerViewForSection = nil,withHeightForHeaderInSection aHeightforHeader:heightForHeaderInSection = nil,withCanEdit aCanEditRowAt:canEditRowAt = nil,withRowAction aRowActionAt:editActionsForRowAt = nil,withResueidentifire aResueIdentifire:reuseIdentifierForItem = nil,isPullToRefresh:Bool = false,withRefreshhandler aRefresh:refreshHandler = nil)  {
        
        super.init()
        
        //asign closer to class varibales
        self.tableview = aTableView
        self.cellIdentifier = aCellIdentifier
        self.numberOfSection = aNoOfSec
        self.configureCellBlock = aConfigureCell
        self.estimateHeight = aEstimateHeight
        //self.tableview.estimatedRowHeight = 140
        if (aSizeForItem != nil){
            self.SizeForItem = aSizeForItem
        }
        if (aPagination != nil){
            self.paginationBlock = aPagination
        }
        
        if (aDidSelectRow != nil){
            self.tablwViewDidSelectAtIndexPath = aDidSelectRow
        }
        if (aHeaderViewForSection != nil){
            self.headerViewBlock = aHeaderViewForSection
        }
        if (aHeightforHeader != nil){
            self.heightForHeader = aHeightforHeader
        }
        if (aCanEditRowAt != nil){
            self.canEditRow = aCanEditRowAt
        }
        if (aRowActionAt != nil){
            self.editActionForRow = aRowActionAt
        }
        if (aResueIdentifire != nil){
            self.resueIdentifire = aResueIdentifire
        }
        if (aRefresh != nil){
            self.refreshHandler = aRefresh
        }
        if (isPullToRefresh){
            self.tableview.addSubview(self.refreshControl)
        }
        items = anItems
        
        if isCellXib {
            registerCell()
        }
        
    }
    //method to update collectionview
    func updateTableView(items anItems:[[AnyObject]]!)  {
        items = anItems
        self.tableview.reloadData()
    }
    
    
    //MARK:- TableView Datasource Methods 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.numberOfSection
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var identifire = ""
        let item: AnyObject = self.itemArIndexPath(indexpath: indexPath)
        if self.resueIdentifire != nil {
            identifire = self.resueIdentifire!(indexPath,item)
        }else{
            identifire = self.cellIdentifier[indexPath.section]
        }
        let cell = tableview.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        
        if (self.configureCellBlock != nil){
            self.configureCellBlock!(cell, item, indexPath)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tablwViewDidSelectAtIndexPath != nil {
            let modalObject = itemAtIndexPath(indexPath: indexPath as NSIndexPath)
            tablwViewDidSelectAtIndexPath!(self.tableview, indexPath , modalObject)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (self.SizeForItem != nil){
            return (self.SizeForItem!(self.tableview,indexPath))
        }else{
            return UITableViewAutomaticDimension
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (self.headerViewBlock != nil){
            return self.headerViewBlock!(self.tableview,section)
        }
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (self.heightForHeader != nil){
            return self.heightForHeader!(self.tableview,section)
        }
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard (self.canEditRow != nil) else {
            return false
        }
        return self.canEditRow!(tableView,indexPath)
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        guard (self.editActionForRow != nil) else {
            return [UITableViewRowAction()]
        }
        return self.editActionForRow!(tableView,indexPath)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.paginationBlock != nil && indexPath.row == self.items.count - 1
        {
            self.paginationBlock!(indexPath.row)
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.estimateHeight[indexPath.section]
    }
    
    //MARK: - Getting Modal for Index Path
    func itemAtIndexPath(indexPath: NSIndexPath) -> AnyObject {
        let modelObject = items[indexPath.section][indexPath.row]
        return modelObject
    }
    //MARK:- Register cell
    func registerCell()  {
        
        //Regester cell according to type
        //TODO:- For Temp perpose get value from index 0 This should be fix later
        self.tableview.register(UINib(nibName: self.cellIdentifier[0], bundle: nil), forCellReuseIdentifier: self.cellIdentifier[0])
    }
    func itemArIndexPath(indexpath:IndexPath) -> AnyObject {
        return items[indexpath.section][indexpath.row]
    }
    //MARK:- Refresh handler
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        guard self.refreshHandler != nil else {
            return
        }
        self.refreshHandler!(refreshControl)
    }
}
