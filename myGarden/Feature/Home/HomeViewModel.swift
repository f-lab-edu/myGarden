//
//  HomeViewModel.swift
//  myGarden
//
//  Created by zeze kim on 1/6/25.
//

import UIKit


final class HomeViewModel {
    var coordinator : HomeCoordinator
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    func viewDidLoad() {
        if UserDefaults.standard.object(forKey: "isFirstTime") == nil {
            coordinator.startOnboarding()
        }
    }
    func reset() { // 온보딩 테스트용으로 생성
        print("reset")
        UserDefaults.standard.removeObject(forKey: "isFirstTime")
        UserDefaults.standard.synchronize()
        print("\(UserDefaults.standard.removeObject(forKey: "isFirstTime"))")
    }
    final func diaryAddClicked() {
        coordinator.diaryAdd()
    }
}
