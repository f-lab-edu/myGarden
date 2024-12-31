//
//  Coordinator.swift
//  MyGarden
//
//  Created by zeze kim on 12/30/24.
//

import SwiftUI

protocol Coordinator : AnyObject {
    var parentCoordinator: Coordinator? { get set } // Coordinator를 호출한 상위 Coordinator
    var childCoordinators: [Coordinator] { get set } // 호출한 Coordinator을 담아두는 Coordinator
    
    func start() // Coordinator를 생성하고 해당 함수를 호출
    func finish() // 해당 Coordinator가 끝나면 호출.
    func addChildCoordinator(_ coordinator: Coordinator)
    func removeChildCoordinator(_ coordinator: Coordinator)
}
