//
//  BaseViewController.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 26.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import UIKit
import RxSwift


class BaseViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let autobinder = self as? AutoBinder {
            autobinder.bindViewModel()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
