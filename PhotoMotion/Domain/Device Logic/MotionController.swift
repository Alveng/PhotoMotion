//
//  MotionController.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 24.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import CoreMotion
import RxSwift


class MotionController {
    
    private let manager = CMMotionManager()
    private let updateInterval: Double = 0.5
    
    let spaceAngles: Variable<SpaceAngles> = Variable(SpaceAngles(pitch: 0, yaw: 0, roll: 0))
    
    func startScanning() {
        guard manager.isDeviceMotionAvailable else { return }
        
        manager.deviceMotionUpdateInterval = updateInterval
        manager.startDeviceMotionUpdates(to: OperationQueue.main) { [weak self] (data, error) in
            guard let attitude = data?.attitude, let strongSelf = self else { return }
            
            let pitch = strongSelf.positiveAngle(by: attitude.pitch)
            let yaw = strongSelf.positiveAngle(by: attitude.yaw)
            let roll = strongSelf.positiveAngle(by: attitude.roll)
            self?.spaceAngles.value = SpaceAngles(pitch: pitch, yaw: yaw, roll: roll)
            
            print("pitch x: \(pitch)")
            print("yaw y: \(yaw)")
            print("roll z: \(roll)")
        }
    }
    
    func stopScanning() {
        if manager.isDeviceMotionActive {
            manager.stopDeviceMotionUpdates()
        }
    }
    
    private func positiveAngle(by value: Double) -> CGFloat {
        let angle = CGFloat(value * 180 / .pi)
        return angle > 0 ? angle : 360 + angle
    }
}
