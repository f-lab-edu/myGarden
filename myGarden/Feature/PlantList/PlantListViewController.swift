//
//  PlantListViewController.swift
//  MyGarden
//
//  Created by zeze kim on 1/1/25.
//

import UIKit

final class PlantListViewController : BaseViewController {
    lazy var viewModel = PlantListViewModel(plantListView: self)
    
    override func viewDidLoad() {
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.title = "PlantList"
        self.navigationController?.navigationBar.backgroundColor = ColorChart.background
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: ColorChart.text
        ]
//        let addButton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(addButtonTapped))
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
        addButton.tintColor = ColorChart.primary
        self.navigationItem.rightBarButtonItem = addButton
    }
    @objc func addButtonTapped() {
        viewModel.addButtonTapped()
     }
}
