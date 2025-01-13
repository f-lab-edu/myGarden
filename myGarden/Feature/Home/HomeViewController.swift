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
        view.backgroundColor  = .yellow
        setupTabBar()
        tabBar.backgroundColor = ColorChart.background
        tabBar.tintColor = ColorChart.primary
        tabBar.unselectedItemTintColor = ColorChart.primaryAsh
    }
    
    private func setupTabBar() {
        // 첫 번째 탭
        let plantListCoordinator = PlantListCoordinator()
        plantListCoordinator.start()
        
        // 두 번째 탭
        let plantDiaryListCoordinator = PlantDiaryListCoordinator()
        plantDiaryListCoordinator.start()
        
        // 세 번째 탭
        let plantAlramCoordinator = PlantAlramCoordinator()
        plantAlramCoordinator.start()
        
        // 네 번째 탭
        let myPageViewCoordinator = MyPageCoordinator()
        myPageViewCoordinator.start()
        
        plantListCoordinator.navigationController.tabBarItem = UITabBarItem(
            title: "Plant List",
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
            tag: 2
        )
        
        myPageViewCoordinator.navigationController.tabBarItem = UITabBarItem(
            title: "My Page",
            image: UIImage(systemName: "person.fill"),
            tag: 3
        )
        
        viewControllers = [
            plantListCoordinator.navigationController,
            plantDiaryListCoordinator.navigationController,
            plantAlramCoordinator.navigationController,
            myPageViewCoordinator.navigationController
        ]
        DiaryAddButtonSet()
    }
    private func DiaryAddButtonSet() {
        let button = UIButton(type: .system)
        let buttonSize: CGFloat = 60
        button.frame = CGRect(x: (tabBar.frame.size.width - buttonSize) / 2, y: -buttonSize / 2 - 10, width: buttonSize, height: buttonSize)
        
        button.layer.cornerRadius = buttonSize / 2
        button.layer.borderWidth = 5
        button.layer.borderColor = ColorChart.primary.cgColor
        let pencilIcon = UIImage(systemName: "pencil")?.withRenderingMode(.alwaysTemplate)
        button.setImage(pencilIcon, for: .normal)
        button.tintColor = ColorChart.text
        button.backgroundColor = ColorChart.secondary
        button.addTarget(self, action: #selector(DiaryAddButton), for: .touchUpInside)
        tabBar.addSubview(button)
        tabBar.bringSubviewToFront(button)
        button.isUserInteractionEnabled = true
    }
    
    @objc private func DiaryAddButton() {
        print("DiaryAdd")
        let plantDiaryAddwCoordinator = PlantDiaryAddCoordinator(rootViewController: self)
        plantDiaryAddwCoordinator.start()
    }
}
