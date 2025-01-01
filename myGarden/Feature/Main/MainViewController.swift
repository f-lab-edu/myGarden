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
    var managedObjectContext: NSManagedObjectContext?
    // 1. 유저가 엔티티를 가지고 있는지 확인한다
    // 2. nil 상태에서는 온보딩을 보여주며 엔티티에 데이터를 등록한다
    // 3. 있으면 홈뷰 컨트롤러로 이동
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainViewController start")
        
        DispatchQueue.main.async {
            let user = fetchFirstTime()
            if user == false {
                self.moveToHome()
            } else {
                saveUserData(firstTime: true)
                let onboardingCoordinator = OnboardingCoordinator(rootViewController: self)
                onboardingCoordinator.start {
                    saveUserData(firstTime: false)
                    
                }
            }
            
        }
    }
    
    func moveToHome() {
        DispatchQueue.main.async {
            let homeCoordinator = HomeCoordinator(rootViewController: self)
            homeCoordinator.start()
        }
    }
}
