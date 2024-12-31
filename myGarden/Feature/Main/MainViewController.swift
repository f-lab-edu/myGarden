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
        let user = fetchFirstTime()
        if user == nil {
//            view.backgroundColor = .red
            let onboarding = OnboardingViewController(viewModel: OnboardingViewModel()) {
            // MainViewController 에서 홈뷰 컨트롤러로 푸쉬하는 함수를 내려보내주기?
            // 아니면 온보딩에서 바로 메인뷰로 넘어갈지 고민하기
                // 온보딩에서 해야할 것 1. 유저 엔티티 생성하기 2. 완료시 엔티티의 FirstTime false로 바꿔주기
            }
            onboarding.modalPresentationStyle = .fullScreen
            present(onboarding, animated: true, completion: nil)
    
        }else if user == false {
            view.backgroundColor = .green
            let homeView = HomeViewController()
            homeView.modalPresentationStyle = .fullScreen
            present(homeView, animated: true, completion: nil )
        }else {
            view.tintColor = .blue
        }
        print("MainViewController")
        // 배경색 설정
  
       
    }
    
   
}
