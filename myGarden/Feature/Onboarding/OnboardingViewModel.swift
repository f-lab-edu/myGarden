//
//  ViewModel.swift
//  MyGarden
//
//  Created by zeze kim on 12/28/24.
//

// 데이터 처리와 비즈니스 로직
import UIKit
import CoreData
import RxSwift
import RxCocoa

class OnboardingViewModel {
    let disposeBag = DisposeBag()
    var coordinator: OnboardingCoordinator
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    var _currentPage = BehaviorRelay<Int>(value: 0)
    var currentPage: Observable<Int> {
        return _currentPage.asObservable()
    }
    
    private let _onboardingList = BehaviorRelay<[String]>(value: ["img-flowerpot", "img-hand", "img-leafs", "img-flowerpot", "img-hand", "img-leafs"])
    var onboardingList: Observable<[String]> {
        return _onboardingList.asObservable()
    }
    
    var onboardingListCount: Int {
        return _onboardingList.value.count
    }
    
    func updateCurrentPage(_ newValue: Int) {
        _currentPage.accept(newValue)
 
    }
    
    func scrollToNextPage() {
        if _currentPage.value < onboardingListCount - 1 {
            updateCurrentPage(_currentPage.value + 1)
        } else {
            completeOnboarding()
        }
    }
    
    func scrollToPreviousPage() {
        guard _currentPage.value > 0 else { return }
        updateCurrentPage(_currentPage.value - 1)
    }
    
    func completeOnboarding() {
        coordinator.finish()
    }
    
  
}
