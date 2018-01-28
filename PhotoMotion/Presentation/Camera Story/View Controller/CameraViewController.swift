//
//  CameraViewController.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 24.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import UIKit
import RxSwift


class CameraViewController: BaseViewController, ViewModelHolder, AutoBinder {
    
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var snapButton: UIButton!
    
    typealias VM = CameraViewModel
    var viewModel: CameraViewModel?
    var rotationProperties: [RotationProperty]?
    
    let photoSegue = "toPhoto"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CameraViewModel(rotationProperties: rotationProperties)
        subscribeToEvents()
    }
    
    private func subscribeToEvents() {
        viewModel?.isCameraReady
            .asObservable()
            .subscribe({ [weak self] _ in
                guard let strongSelf = self else { return }
                try? strongSelf.viewModel?.cameraController.displayPreview(on: strongSelf.previewView)
            }).disposed(by: disposeBag)
        
        viewModel?.isCanSnap
            .asDriver()
            .drive(onNext: { [weak self] (isCanSnap) in
                self?.snapButton.isEnabled = isCanSnap
            }).disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == photoSegue, let image = sender as? UIImage {
            let vc = segue.destination as! ImageViewController
            vc.photo = image
        }
    }
    
    // MARK: Action
    
    @IBAction func takePhoto(_ sender: Any) {
        viewModel?.cameraController.captureImage { [weak self] (image, error) in
            guard let image = image, let strongSelf = self else {
                print(error ?? "Image capture error")
                return
            }
            
            strongSelf.performSegue(withIdentifier: strongSelf.photoSegue, sender: image)
        }
    }
}
