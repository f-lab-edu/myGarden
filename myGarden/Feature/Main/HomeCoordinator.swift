//
//  HomeCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/1/25.
//

import UIKit

class HomeCoordinator : BaseCoordinator {
    var rootViewController: BaseViewController
    
    init(rootViewController: BaseViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        // 홈 화면을 보여줄 뷰 컨트롤러 생성
        let homeViewController = HomeViewController()
        homeViewController.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.rootViewController.present(homeViewController, animated: true)
        }
    }
}
