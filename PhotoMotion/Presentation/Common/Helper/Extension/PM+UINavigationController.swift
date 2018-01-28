//
//  PM+UINavigationController.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 27.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import UIKit


extension UINavigationController {
    
    func popTwice() {
        popViewController(animated: false)
        popViewController(animated: true)
    }
}
