//
//  PM+NSObject.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 26.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import Foundation


extension NSObject {
    
    static func className() -> String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
