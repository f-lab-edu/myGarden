//
//  HomeViewController.swift
//  MyGarden
//
//  Created by zeze kim on 1/1/25.
//

import UIKit


class HomeViewController : BaseTabViewController {
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .orange
        setupTabBar()
        tabBar.backgroundColor = ColorChart.background
        tabBar.tintColor = ColorChart.primary
        tabBar.unselectedItemTintColor = ColorChart.primaryAsh
        
    }
    
    private func setupTabBar() {
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
        
        plantListCoordinator.navigationController.tabBarItem = UITabBarItem(
            title: "Plant",
            image: UIImage(systemName: "leaf.fill"),
            tag: 0
        )
        
        plantDiaryListCoordinator.navigationController.tabBarItem = UITabBarItem(
            title: "Diary",
            image: UIImage(systemName: "book.fill"),
            tag: 1
        )
        
        plantAlramCoordinator.navigationController.tabBarItem = UITabBarItem(
            title: "Alram",
            image: UIImage(systemName: "bell.fill"),
            tag: 3
        )
        
        myPageViewCoordinator.navigationController.tabBarItem = UITabBarItem(
            title: "MyPage",
            image: UIImage(systemName: "person.fill"),
            tag: 4
        )
        
        viewControllers = [
            plantListCoordinator.navigationController,
            plantDiaryListCoordinator.navigationController,
            UIViewController(), // 글쓰기 버튼을 위한 빈 공간 생성
            plantAlramCoordinator.navigationController,
            myPageViewCoordinator.navigationController
        ]
        DiaryAddButtonSet()
        
    }
    private func DiaryAddButtonSet() {
        let button = UIButton(type: .system)
        let buttonSize: CGFloat = 65
        button.frame = CGRect(x: (tabBar.frame.size.width - buttonSize) / 2, y: -buttonSize / 6, width: buttonSize, height: buttonSize)
        button.layer.cornerRadius = buttonSize / 2
        button.layer.borderWidth = 5
        button.layer.borderColor = ColorChart.primaryAsh.cgColor
        
        let icon = UIImage(systemName: "pencil")?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 30))
        var config = UIButton.Configuration.plain()
        config.image = icon?.withRenderingMode(.alwaysTemplate)
        config.imagePlacement = .top
        config.imagePadding = 5

        button.configuration = config
        button.tintColor = ColorChart.primary
        button.backgroundColor = ColorChart.backgroundLight
        button.addTarget(self, action: #selector(DiaryAddButton), for: .touchUpInside)
        tabBar.addSubview(button)
    }
    
    @objc private func DiaryAddButton() {
        let plantDiaryAddCoordinator = PlantDiaryAddCoordinator(rootViewController: self)
        plantDiaryAddCoordinator.start()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBar.items?[2].isEnabled = false
    }

}
