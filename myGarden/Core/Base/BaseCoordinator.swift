//
//  BaseCodinator.swift
//  MyGarden
//
//  Created by zeze kim on 12/30/24.
//

import UIKit

class BaseCoordinator: Coordinator {
    //    var parentCoordinator: Coordinator?
    func start() {
        fatalError("start가 비었습니다")
    }
    
    //    var childCoordinators: [Coordinator] = []
    //
    func finish() {
        fatalError("finish가 비었습니다")
    }
    
    //    func addChildCoordinator(_ coordinator:  Coordinator) {
    //        childCoordinators.append(coordinator)
    //    }
    
    //    func removeChildCoordinator(_ coordinator: Coordinator) {
    //        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
    //            childCoordinators.remove(at: index)
    //        } else {
    //            print("coordinator 삭제 실패: \(coordinator). ")
    //        }
    //
    //    }
}
