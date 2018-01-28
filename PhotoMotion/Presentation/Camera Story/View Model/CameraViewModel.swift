//
//  CameraViewModel.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 26.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import RxSwift


class CameraViewModel: ViewModel {
    
    var motionController = MotionController()
    let cameraController = CameraController()
    
    let isCameraReady: PublishSubject<Bool> = PublishSubject()
    let isCanSnap: Variable<Bool> = Variable(false)
    private var rotationProperties: [RotationProperty]?
    
    init(rotationProperties: [RotationProperty]?) {
        self.rotationProperties = rotationProperties
        super.init()
        
        configureCameraController()
        subscribeToEvents()
    }
    
    private func configureCameraController() {
        cameraController.prepare { [weak self] (error) in
            if let error = error {
                print(error)
            }
            self?.isCameraReady.onCompleted()
        }
    }
    
    private func subscribeToEvents() {
        motionController.spaceAngles
            .asObservable()
            .subscribe(onNext: { [weak self] (angles) in
                self?.isCanSnap.value = angles.isConfirm(properties: self?.rotationProperties ?? [])
            }).disposed(by: disposeBag)
        
        didBecomeActive
            .cast(CameraViewModel.self)
            .subscribe(onNext: { [weak self] _ in
                self?.motionController.startScanning()
            }).disposed(by: disposeBag)
        
        didBecomeInactive
            .cast(CameraViewModel.self)
            .subscribe(onNext: { [weak self] _ in
                self?.motionController.stopScanning()
            }).disposed(by: disposeBag)
    }
}
