//
//  HomeViewController.swift
//  MyGarden
//
//  Created by zeze kim on 1/1/25.
//

import UIKit


class HomeViewController : BaseViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .yellow
        let button = UIButton(type: .system)
        button.setTitle("deleteAllUserData", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        if UserDefaults.standard.object(forKey: "isFirstTime") == nil {
            UserDefaults.standard.set(true, forKey: "isFirstTime")
            let onboardingCoordinator = OnboardingCoordinator(rootViewController: self)
            onboardingCoordinator.start ()
        }
    }
    func moveToHome() {
        DispatchQueue.main.async {
            let homeCoordinator = HomeCoordinator(rootViewController: self)
            homeCoordinator.start()
            
        }
        
        
    }
    @objc func buttonTapped() {
        UserDefaults.standard.removeObject(forKey: "isFirstTime")
    }
}
