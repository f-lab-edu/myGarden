//
//  PlantAlramCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/13/25.
//

import UIKit

class PlantAlramCoordinator : BaseCoordinator {
    
    var navigationController: UINavigationController!
       
       override func start() {
           let plantAlarmViewController = PlantAlarmViewController()
           navigationController = UINavigationController(rootViewController: plantAlarmViewController)
       }
    
}
