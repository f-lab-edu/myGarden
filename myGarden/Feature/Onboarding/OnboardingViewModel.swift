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

    var _currentPage = BehaviorRelay<Int>(value: 0)
    var currentPage: Observable<Int> {
        return _currentPage.asObservable()
    }
    func updateCurrentPage(_ newValue: Int) {
        _currentPage.accept(newValue)
    }
    
    private let _onboardingList = BehaviorRelay<[String]>(value: ["img-flowerpot", "img-hand","img-leafs","img-flowerpot", "img-hand","img-leafs"])
    var onboardingList: Observable<[String]> {
        return _onboardingList.asObservable()
    }
    var onboardingListCount: Int {
            return _onboardingList.value.count
        }
    func updatePageIndex(for scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        updateCurrentPage(page)
    }
    
    func scrollToNextPage(scrollView: UIScrollView) {
        guard _currentPage.value != onboardingListCount - 1 else { return }
        updateCurrentPage(_currentPage.value + 1)
        let nextOffsetX = CGFloat(_currentPage.value) * scrollView.frame.width
        scrollView.setContentOffset(CGPoint(x: nextOffsetX, y: 0), animated: true)
    }
    
    func scrollToPreviousPage(scrollView: UIScrollView) {
        guard _currentPage.value > 0 else { return }
        updateCurrentPage(_currentPage.value - 1)
        let prevOffsetX = CGFloat(_currentPage.value) * scrollView.frame.width
        scrollView.setContentOffset(CGPoint(x: prevOffsetX, y: 0), animated: true)
    }
 
    func completeOnboarding() {
        UserDefaults.standard.set(false, forKey: "isFirstTime")
    }
    
}
