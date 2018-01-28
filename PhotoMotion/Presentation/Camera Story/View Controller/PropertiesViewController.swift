//
//  PropertiesViewController.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 26.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import UIKit


class PropertiesViewController: TableViewController, ViewModelHolder, AutoBinder {

    typealias VM = PropertiesViewModel
    
    var viewModel: PropertiesViewModel? = PropertiesViewModel()
    var dataSource: TableViewDataSource<PropertiesViewController>?
    let cameraSegue = "toCamera"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = TableViewDataSource(for: self, store: &dataSource)
        
        viewModel?.cellViewModels
            .asObservable()
            .subscribe(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            }).disposed(by: disposeBag)
    }

    override func configureCellMap() -> CellMap {
        return [
            SliderCellViewModel.className(): SliderTableViewCell.className()
        ]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == cameraSegue, let dest = segue.destination as? CameraViewController {
            dest.rotationProperties = viewModel?.rotationProperties()
        }
    }
    
    // MARK: Action
    
    @IBAction func goToCamera(_ sender: Any) {
        performSegue(withIdentifier: cameraSegue, sender: nil)
    }
}
