//
//  TableViewController.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 26.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import UIKit


typealias CellMap = [String: String]

protocol CellMapper {
    var cellMap: CellMap { get }
    func configureCellMap() -> CellMap
}

class TableViewController: BaseViewController, CellMapper {
    
    @IBOutlet weak var tableView: UITableView!
    
    private (set) var cellMap: CellMap = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        
        cellMap = configureCellMap()
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    func configureCellMap() -> CellMap {
        preconditionFailure("\(#function) should be implemented in subclass")
    }
}
