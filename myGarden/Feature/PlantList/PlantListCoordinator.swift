//
//  PlantListCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/13/25.
//

import UIKit

class PlantListCoordinator :BaseCoordinator {
    var navigationController: UINavigationController!
       
       override func start() {
           let plantListViewController = PlantListViewController()
           navigationController = UINavigationController(rootViewController: plantListViewController)
       }
}
