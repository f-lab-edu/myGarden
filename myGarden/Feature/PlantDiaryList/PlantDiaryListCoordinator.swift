//
//  PlantDiaryCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/13/25.
//

import UIKit

class PlantDiaryListCoordinator : BaseCoordinator {
    
    var navigationController: UINavigationController!
       
       override func start() {
           let plantDiaryListViewController = PlantDiaryListViewController()
           navigationController = UINavigationController(rootViewController: plantDiaryListViewController)
       }
    
}
