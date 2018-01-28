//
//  PM+UITableView.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 26.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import UIKit


extension UITableView {
    
    func reusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell? {
        loadAndRegisterCell(withIdentifier: identifier)
        return self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    private func loadAndRegisterCell(withIdentifier identifier: String) {
        let cellNib = UINib(nibName: identifier, bundle: Bundle.main)
        self.register(cellNib, forCellReuseIdentifier: identifier)
    }
}
