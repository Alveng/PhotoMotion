//
//  SliderCellViewModel.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 26.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import UIKit


struct SliderRange {
    var from: CGFloat
    var to: CGFloat
}

enum AngleType: String {
    case pitch
    case yaw
    case roll
}

class SliderCellViewModel: CellViewModel {
    
    let range: SliderRange
    var selectedRange: SliderRange
    let type: AngleType
    var name: String {
        return type.rawValue.localized()
    }
    
    init(type: AngleType, range: SliderRange) {
        self.type = type
        self.range = range
        self.selectedRange = range
    }
}
