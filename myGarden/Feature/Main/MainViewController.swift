//
//  MainViewController.swift
//  MyGarden
//
//  Created by zeze kim on 1/1/25.
//
// MainViewController.swift

import UIKit
import CoreData

class MainViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if UserDefaults.standard.object(forKey: "isFirstTime") == nil {
            UserDefaults.standard.set(true, forKey: "isFirstTime")
            view.backgroundColor = .red
            
            let onboardingCoordinator = OnboardingCoordinator(rootViewController: self)
            onboardingCoordinator.start {
                UserDefaults.standard.set(false, forKey: "isFirstTime")
                self.moveToHome()
            }
        } else {
            view.backgroundColor = .green
            let homeView = HomeViewController()
            homeView.modalPresentationStyle = .fullScreen
            present(homeView, animated: true, completion: nil)
            
            
            
        }
        
    }
    func moveToHome() {
        DispatchQueue.main.async {
            let homeCoordinator = HomeCoordinator(rootViewController: self)
            homeCoordinator.start()
            
        }
        
        
    }
}
