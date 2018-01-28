//
//  CellArrayViewModel.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 26.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import Foundation
import RxSwift
import ObservableArray_RxSwift


typealias ViewModelObservableArray<T: ViewModelType> = Variable<ObservableArray<T>>

protocol CellArrayViewModelType: ViewModelType {
    associatedtype T: CellViewModelType
    
    var cellViewModels: ViewModelObservableArray<T> { get set }
}

extension CellArrayViewModelType {
    
    func numberOfGroups() -> Int {
        return cellViewModels.value.count > 0 ? 1 : 0
    }
    func numberOfItemsInGroup(atIndex index: Int) -> Int {
        return cellViewModels.value.count
    }
    func itemViewModel(inGroup groupIndex: Int, atIndex index: Int) -> T {
        return cellViewModels.value[index]
    }
    func titleForGroup(atIndex index: Int) -> String {
        return ""
    }
}

class CellArrayViewModel<CellType: CellViewModelType>: ViewModel, CellArrayViewModelType {
    
    typealias T = CellType
    
    var cellViewModels: ViewModelObservableArray<CellType> = ViewModelObservableArray(ObservableArray())
}
