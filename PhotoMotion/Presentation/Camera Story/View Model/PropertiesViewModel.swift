//
//  CameraViewModel.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 26.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import RxSwift
import ObservableArray_RxSwift


struct RotationProperty {
    let type: AngleType
    let range: SliderRange
}

class PropertiesViewModel: CellArrayViewModel<CellViewModel> {

    override init() {
        super.init()
        
        configureCellViewModels()
    }

    private func configureCellViewModels() {
        var cells: [CellViewModel] = []
        let roundRange = SliderRange(from: 0, to: 360)
        
        cells.append(SliderCellViewModel(type: .pitch, range: roundRange))
        cells.append(SliderCellViewModel(type: .yaw, range: roundRange))
        cells.append(SliderCellViewModel(type: .roll, range: roundRange))
        
        cellViewModels.value = ObservableArray(cells)
    }
    
    func rotationProperties() -> [RotationProperty] {
        var properties = [RotationProperty]()
        
        var property: RotationProperty?
        for cell in cellViewModels.value {
            guard let sliderCell = cell as? SliderCellViewModel else { continue }
            property = RotationProperty(type: sliderCell.type, range: sliderCell.selectedRange)
            properties.append(property!)
        }
        
        return properties
    }
}
