//
//  MyPageCoordinator.swift
//  myGarden
//
//  Created by zeze kim on 1/13/25.
//

import UIKit

class MyPageCoordinator : BaseCoordinator {
    
    var navigationController: UINavigationController!
       
       override func start() {
           let myPageViewController = MyPageViewController()
           navigationController = UINavigationController(rootViewController: myPageViewController)
       }
    
}
