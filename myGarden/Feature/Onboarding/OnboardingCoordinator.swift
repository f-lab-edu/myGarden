//
//  OnboardingCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/1/25.
//
import UIKit
import RxSwift

final class OnboardingCoordinator: BaseCoordinator {
    var rootViewController : UITabBarController
    
    
    init(rootViewController: UITabBarController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        UserDefaults.standard.removeObject(forKey: "isFirstTime")
        UserDefaults.standard.synchronize()
        let onboardingViewModel = OnboardingViewModel(coordinator: self)
        let onboardingViewController = OnboardingViewController(viewModel: onboardingViewModel)
        onboardingViewController.modalPresentationStyle = .fullScreen
        rootViewController.present(onboardingViewController, animated: true)
    }
    
    override func finish() {
        rootViewController.presentedViewController?.dismiss(animated: true)
    }
}
