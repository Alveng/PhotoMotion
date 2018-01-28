//
//  ImageViewController.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 25.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import UIKit

class ImageViewController: BaseViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photo: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photoImageView.image = photo
    }
    
    // MARK: Action
    
    @IBAction func repeatPhoto(_ sender: Any) {
        navigationController?.popTwice()
    }
    
}
