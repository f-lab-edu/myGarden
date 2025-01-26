//
//  HomeViewController.swift
//  MyGarden
//
//  Created by zeze kim on 1/1/25.
//
import UIKit

final class HomeViewController : UITabBarController {
    var homeCoordinator : HomeCoordinator?
    var viewModel : HomeViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorChart.background
        tabBarSettting()
        diaryAddButtonSet()
        viewModel?.reset()
    }
    
    private func tabBarSettting(){
        tabBar.backgroundColor = ColorChart.background
        tabBar.tintColor = ColorChart.primary
        tabBar.unselectedItemTintColor = ColorChart.primaryAsh
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupTabBarItems()
        tabBar.items?[2].isEnabled = false
    }
    
    private func setupTabBarItems() {
        guard let viewControllers = self.viewControllers else { return }
        
        // 식물 리스트 탭
        viewControllers[0].tabBarItem = UITabBarItem(
            title: "", //Plant
            image: UIImage(systemName: "leaf.fill"),
            tag: 0
        )
        
        // 식물 일기 리스트 탭
        viewControllers[1].tabBarItem = UITabBarItem(
            title: "", //Diary
            image: UIImage(systemName: "book.fill"),
            tag: 1
        )
        
        // 물주기 알람 탭
        viewControllers[3].tabBarItem = UITabBarItem(
            title: "", //Alram
            image: UIImage(systemName: "bell.fill"),
            tag: 3
        )
        
        // 마이페이지 탭
        viewControllers[4].tabBarItem = UITabBarItem(
            title: "", //MyPage
            image: UIImage(systemName: "person.fill"),
            tag: 4
        )
    }
    private func diaryAddButtonSet() {
        let button = UIButton(type: .system)
        let buttonSize: CGFloat = 65
        button.frame = CGRect(x: (tabBar.frame.size.width - buttonSize) / 2,
                              y: -buttonSize / 6,
                              width: buttonSize,
                              height: buttonSize)
        
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
        tabBar.bringSubviewToFront(button)
        
    }
    @objc private func DiaryAddButton() {
        if let coordinator = homeCoordinator {
            let viewModel = HomeViewModel(coordinator: coordinator)
            viewModel.diaryAddClicked()
        }
    }
}
