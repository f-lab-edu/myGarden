//
//  OnboardingViewController.swift
//  MyForest
//
//  Created by zeze kim on 1/1/25.
//
import UIKit
import SnapKit

class OnboardingViewController: BaseViewController {
    
    var viewModel: OnboardingViewModel!
       var onComplete: () -> Void
       private var pageViewController: UIPageViewController!
       
       // 이 초기화자는 외부에서 호출할 수 있도록 변경합니다.
       init(viewModel: OnboardingViewModel, onComplete: @escaping () -> Void) {
           self.viewModel = viewModel
           self.onComplete = onComplete
           super.init(nibName: nil, bundle: nil)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func viewDidLoad() {
           super.viewDidLoad()
           print("OnboardingViewController")
           view.backgroundColor = ColorChart.background
           

       }
       
   
   }
