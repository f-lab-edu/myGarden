//
//  HomeCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/1/25.
//

import UIKit

class HomeCoordinator : BaseCoordinator {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    
    override func start() {
        let homeViewController = HomeViewController()
        window?.rootViewController = homeViewController
        window?.makeKeyAndVisible()
        if UserDefaults.standard.object(forKey: "isFirstTime") == nil {
            let onboardingCoordinator = OnboardingCoordinator(rootViewController: homeViewController)
            onboardingCoordinator.start()
        }
    }
    
    
}
