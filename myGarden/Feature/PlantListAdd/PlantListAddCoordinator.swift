//
//  PlantListAddCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/19/25.
//

final class PlantListAddCoordinator : BaseCoordinator{
    var rootViewController : BaseViewController
    
    
    init(rootViewController: BaseViewController) {
        self.rootViewController = rootViewController
    }
    override func start() {
        let plantListAddViewController = PlantListAddViewController()
        rootViewController.navigationController?.pushViewController(plantListAddViewController, animated: true)
    }
}
