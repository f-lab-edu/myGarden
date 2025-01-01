//
//  OnboardingCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/1/25.
//
import UIKit

class OnboardingCoordinator: BaseCoordinator {
    var rootViewController: BaseViewController
    
    init(rootViewController: BaseViewController) {
        self.rootViewController = rootViewController
    }
    
    func start(onComplete: @escaping () -> Void) {
        let viewModel = OnboardingViewModel()
        let onboardingViewController = OnboardingViewController(viewModel: viewModel, onComplete: onComplete)
     
        onboardingViewController.modalPresentationStyle = .fullScreen
        rootViewController.present(onboardingViewController, animated: true)
        

        onboardingViewController.onComplete = {
            onComplete()
            onboardingViewController.dismiss(animated: true) {
                self.moveToHome()
            }
        }
    }
    func moveToHome() {
        let homeCoordinator = HomeCoordinator(rootViewController: self.rootViewController)
        homeCoordinator.start()
    }
}
