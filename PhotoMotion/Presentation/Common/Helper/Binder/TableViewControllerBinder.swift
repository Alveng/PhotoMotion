//
//  TableViewControllerBinder.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 26.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import Foundation
import RxSwift


class TableViewControllerBinder<T: TableViewController & ViewModelHolder>: ViewControllerBinder<T> where T.VM: CellArrayViewModelType {
    
    override class func bindViewModel(holder: T) {
        super.bindViewModel(holder: holder)
    }
}

extension AutoBinder where Self: TableViewController, Self: ViewModelHolder, Self.VM: CellArrayViewModelType {
    
    func bindViewModel() {
        TableViewControllerBinder.bindViewModel(holder: self)
    }
}
