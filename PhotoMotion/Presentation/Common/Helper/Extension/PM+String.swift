//
//  PM+String.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 27.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import Foundation


extension String {
    
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
