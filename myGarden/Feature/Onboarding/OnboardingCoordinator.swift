//
//  OnboardingCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/1/25.
//
import UIKit
import RxSwift

class OnboardingCoordinator: BaseCoordinator {
    var rootViewController : BaseViewController
   
    
    init(rootViewController: BaseViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        let onboardingViewController = OnboardingViewController()
        UserDefaults.standard.set(true, forKey: "isFirstTime")
        onboardingViewController.modalPresentationStyle = .fullScreen
        onboardingViewController.coordinator = self
        rootViewController.present(onboardingViewController, animated: true)
        
    }
    override func finish() {
        print("onboarding finish")
        rootViewController.presentedViewController?.dismiss(animated: true)
    }
}
