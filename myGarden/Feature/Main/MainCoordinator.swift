//
//  MainCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/1/25.
//
import UIKit

class MainCoordinator: BaseCoordinator {
    
    var rootViewController: BaseViewController
    
    init(rootViewController: BaseViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        
    }
    
    func goToOnboarding () {
        let onboardingCoordinator = OnboardingCoordinator(rootViewController: MainViewController())
        onboardingCoordinator.start {
            print("Onboarding 완료 ")
            self.goToHome ()
        }
    }
    
    func goToHome () {
        let HomeViewController = HomeViewController()
        HomeViewController.modalPresentationStyle = .fullScreen
        rootViewController.present(HomeViewController, animated: true)
    }
}
