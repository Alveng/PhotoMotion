//
//  PM+Observable.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 28.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import RxSwift


extension Observable {
    
    func cast<T>(_ to: T.Type) -> Observable<T> {
        return self.map({ $0 as! T })
    }
}
