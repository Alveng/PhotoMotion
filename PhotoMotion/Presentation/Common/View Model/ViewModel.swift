//
//  ViewModel.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 26.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import RxViewModel
import RxSwift


protocol ViewModelType: class {
    var active: Bool { get set }
}

class ViewModel: RxViewModel, ViewModelType {
    
    let errorBus: PublishSubject<Error> = PublishSubject()
    let disposeBag = DisposeBag()
}
