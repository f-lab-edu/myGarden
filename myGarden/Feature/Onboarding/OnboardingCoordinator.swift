//
//  OnboardingCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/1/25.
//
import UIKit
import RxSwift
class OnboardingCoordinator: BaseCoordinator {
    var rootViewController: BaseViewController
    
    init(rootViewController: BaseViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        let viewModel = OnboardingViewModel()
        let onboardingViewController = OnboardingViewController(viewModel: viewModel)
     
        onboardingViewController.modalPresentationStyle = .fullScreen
        rootViewController.present(onboardingViewController, animated: true)
        
    }
    func moveToHome() {
        let homeCoordinator = HomeCoordinator(rootViewController: self.rootViewController)
        homeCoordinator.start()
    }

    
//    func startRx() -> Observable<Void> {
//            return Observable<Void>.create { observer in
//                self.start {
//                    observer.onNext(())
//                    observer.onCompleted()
//                }
//                return Disposables.create()
//            }
//        }

}
