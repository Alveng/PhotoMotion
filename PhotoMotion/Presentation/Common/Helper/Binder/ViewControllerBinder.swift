//
//  ViewControllerBinder.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 26.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import RxCocoa


class ViewControllerBinder<T: BaseViewController & ViewModelHolder>: Binder<T> {
    
    override class func bindViewModel(holder: T) {
        holder.rx.methodInvoked(#selector(holder.viewWillAppear(_:)))
            .subscribe({ [weak holder] _ in
                holder?.viewModel?.active = true
            }).disposed(by: holder.disposeBag)
        
        holder.rx.methodInvoked(#selector(holder.viewDidDisappear(_:)))
            .subscribe({ [weak holder] _ in
                holder?.viewModel?.active = false
            }).disposed(by: holder.disposeBag)
    }
}

extension AutoBinder where Self: BaseViewController, Self: ViewModelHolder {
    
    func bindViewModel() {
        ViewControllerBinder.bindViewModel(holder: self)
    }
}
