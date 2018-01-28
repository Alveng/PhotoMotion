//
//  SpaceAngles.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 27.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import UIKit


struct SpaceAngles {
    let pitch: CGFloat
    let yaw: CGFloat
    let roll: CGFloat
}

extension SpaceAngles {
    
    func isConfirm(properties: [RotationProperty]) -> Bool {
        for property in properties {
            switch property.type {
            case .pitch: if angle(angle: pitch, outOf: property.range) { return false }
            case .yaw: if angle(angle: yaw, outOf: property.range) { return false }
            case .roll: if angle(angle: roll, outOf: property.range) { return false }
            }
        }
        return true
    }
    
    private func angle(angle: CGFloat, outOf range: SliderRange) -> Bool {
        return angle < range.from || angle > range.to
    }
}
