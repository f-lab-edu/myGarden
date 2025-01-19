//
//  PlantListViewModel.swift
//  myGarden
//
//  Created by zeze kim on 1/13/25.
//

final class PlantListViewModel {
    var plantListView : PlantListViewController
    init(plantListView: PlantListViewController) {
        self.plantListView = plantListView
    }
    
    func addButtonTapped () {
        let plantaddviewCoordinator = PlantListAddCoordinator(rootViewController:plantListView)
        plantaddviewCoordinator.start()
    }
    
}
