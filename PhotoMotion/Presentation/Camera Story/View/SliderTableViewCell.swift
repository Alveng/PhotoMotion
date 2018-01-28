//
//  SliderTableViewCell.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 26.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import UIKit
import RangeSeekSlider


class SliderTableViewCell: TableViewCell, ViewModelHolder, CellAutoBinder {
    
    typealias VM = SliderCellViewModel
    
    @IBOutlet weak var slider: RangeSeekSlider!
    @IBOutlet weak var nameLabel: UILabel!
    
    private let defaultSelectedMaxMultiplier: CGFloat = 0.9
    private let defaultSelectedMinMultiplier: CGFloat = 0.1
    
    var viewModel: SliderCellViewModel? {
        didSet {
            guard let vm = viewModel else { return }
            
            slider.delegate = self
            configureTitle(by: vm.name)
            configureSlider(by: vm.range)
        }
    }
    
    private func configureSlider(by range: SliderRange) {
        slider.minValue = range.from
        slider.maxValue = range.to
        
        let preselectedMin = floor(range.to * defaultSelectedMinMultiplier)
        let preselectedMax = floor(range.to * defaultSelectedMaxMultiplier)
        slider.selectedMinValue = preselectedMin
        slider.selectedMaxValue = preselectedMax
        viewModel?.selectedRange = SliderRange(from: preselectedMin, to: preselectedMax)
    }
    
    private func configureTitle(by name: String) {
        nameLabel.text = name
    }
}

extension SliderTableViewCell: RangeSeekSliderDelegate {
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        viewModel?.selectedRange.from = minValue
        viewModel?.selectedRange.to = maxValue
    }
}
