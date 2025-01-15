//
//  PlantDiaryAddCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/13/25.
//

import UIKit

class PlantDiaryAddCoordinator : BaseCoordinator {
    
    private let rootViewController: UIViewController

        init(rootViewController: UIViewController) {
            self.rootViewController = rootViewController
        }

        override func start() {
            print("PlantDiaryAddCoordinator")
            print(rootViewController)
            let plantDiaryAddViewController = PlantDiaryAddViewController()
            rootViewController.present(plantDiaryAddViewController, animated: true, completion: nil)
        }

    
    }
