//
//  BaseCodinator.swift
//  MyForest
//
//  Created by zeze kim on 12/30/24.
//

import SwiftUI

class BaseCoordinator: Coordinator {
    func start() -> AnyView { // 코디네이터를 시작하여 화면의 초기화, 설정
        fatalError("start err")
    }
    
//    var parentCoordinator: (any Coordinator)? // 부모 코디네이터를 참조한다
    
    var children: [Coordinator] = [] // 자식 코디네이터를 저장한다

    
  
    func addChild(coordinator: Coordinator) {
        children.append(coordinator)
    }
    
    func removeChild(coordinator: Coordinator) {
        children.removeAll { $0 === coordinator }
    }
}
