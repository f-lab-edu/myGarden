//
//  OnboardingCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/1/25.
//
import UIKit
import RxSwift

final class OnboardingCoordinator: BaseCoordinator {
    var rootViewController : BaseViewController
    
    
    init(rootViewController: BaseViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        let onboardingViewController = OnboardingViewController()
        onboardingViewController.viewModel = OnboardingViewModel(coordinator: self)
        onboardingViewController.modalPresentationStyle = .fullScreen
        rootViewController.present(onboardingViewController, animated: true)
    }
    
    override func finish() {
        UserDefaults.standard.set(false, forKey: "isFirstTime")
        rootViewController.presentedViewController?.dismiss(animated: true)
    }
}
