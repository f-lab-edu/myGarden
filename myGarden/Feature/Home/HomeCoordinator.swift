//
//  HomeCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/1/25.
//

import UIKit

final class HomeCoordinator : BaseCoordinator {
    var navigationController: UINavigationController
    var homeTabBarController: HomeViewController

    var window: UIWindow?
    init(window: UIWindow?) {
        self.window = window
        self.homeTabBarController = HomeViewController()
        self.navigationController = UINavigationController()
    }
    
    override func start() {
        homeTabBarSetting()
        homeTabBarController.viewModel = HomeViewModel(coordinator: self)
        homeTabBarController.homeCoordinator = self
        navigationController.navigationBar.isHidden = true
        navigationController.viewControllers = [homeTabBarController]

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        if UserDefaults.standard.object(forKey: "isFirstTime") == nil {
            let onboardingCoordinator = OnboardingCoordinator(rootViewController: homeTabBarController)
            onboardingCoordinator.start()
        }
        
    }
    
    func startOnboarding() {
        let onboardingCoordinator = OnboardingCoordinator(rootViewController: homeTabBarController)
        onboardingCoordinator.start()
    }
    
    private func homeTabBarSetting() {
        // 식물 리스트 탭
        let plantListCoordinator = PlantListCoordinator()
        plantListCoordinator.start()
        
        // 식물 일기 리스트 탭
        let plantDiaryListCoordinator = PlantDiaryListCoordinator()
        plantDiaryListCoordinator.start()
        
        // 물주기 알람 탭
        let plantAlramCoordinator = PlantAlramCoordinator()
        plantAlramCoordinator.start()
        
        // 마이페이지 탭
        let myPageViewCoordinator = MyPageCoordinator()
        myPageViewCoordinator.start()
        
        homeTabBarController.viewControllers = [
            plantListCoordinator.navigationController,
            plantDiaryListCoordinator.navigationController,
            UIViewController(), // 글쓰기 버튼을 위한 빈 공간 생성
            plantAlramCoordinator.navigationController,
            myPageViewCoordinator.navigationController
        ]
    }
    
    final func diaryAdd() {
        let plantDiaryAddCoordinator = PlantDiaryAddCoordinator(rootViewController: homeTabBarController)
        plantDiaryAddCoordinator.start()
    }
}
