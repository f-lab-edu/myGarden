//
//  MainViewController.swift
//  MyForest
//
//  Created by zeze kim on 1/1/25.
//
// MainViewController.swift

import UIKit
import CoreData

class MainViewController: UIViewController {
    var managedObjectContext: NSManagedObjectContext?
    // 1. 유저가 엔티티를 가지고 있는지 확인한다
    // 2. nil 상태에서는 로딩화면을 보여준다
    // 3. 없으면 온보딩 있으면 홈뷰 컨트롤러로 이동
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainViewController")
        // 배경색 설정
        view.backgroundColor = .white
        view.tintColor = .white
    
    }
    
   
}
