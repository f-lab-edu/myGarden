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
    
    private let _buttonSet : BehaviorRelay<OnboardingButtonModel> = .init(value : OnboardingButtonModel(skipButtonSet: ColorChart.primary, nextButttonSet: ColorChart.primary,previousButtonSet : ColorChart.primaryAsh,nextButtonImgSet: UIImage(systemName: "arrow.right.circle.fill")?.resized(to: CGSize(width: 50, height: 50))))
    
    private var _currentPage = BehaviorRelay<Int>(value: 0)
    
    
    private let _onboardingList = BehaviorRelay<[String]>(value: ["img-flowerpot", "img-hand", "img-leafs", "img-flowerpot", "img-hand", "img-leafs"])
    
    
    private var onboardingListCount: Int {
        return _onboardingList.value.count
    }
    private func buttonViewModelUpdate() {
        let isLastPage = _currentPage.value == onboardingListCount - 1
        _buttonSet.accept(OnboardingButtonModel(skipButtonSet: isLastPage ? ColorChart.accent : ColorChart.primary, nextButttonSet: _currentPage.value != 0 ? ColorChart.primary : ColorChart.primaryAsh, previousButtonSet: isLastPage ? ColorChart.primary : ColorChart.primary, nextButtonImgSet: isLastPage ? UIImage(systemName: "checkmark.circle.fill")?.resized(to: CGSize(width: 50, height: 50)): UIImage(systemName: "arrow.right.circle.fill")?.resized(to: CGSize(width: 50, height: 50))))
        
    }
    private func updateCurrentPage(_ newValue: Int) {
        _currentPage.accept(newValue)
        buttonViewModelUpdate()
    }
    
    private func scrollToNextPage() {
        if _currentPage.value < onboardingListCount - 1 {
            updateCurrentPage(_currentPage.value + 1)
        } else {
            completeOnboarding()
        }
    }
    
    private func scrollToPreviousPage() {
        guard _currentPage.value > 0 else { return }
        updateCurrentPage(_currentPage.value - 1)
    }
    
    private func completeOnboarding() {
        UserDefaults.standard.set(false, forKey: "isFirstTime")
        coordinator.finish()
    }
    
    var currentPage: Observable<Int> {
        return _currentPage.asObservable()
    }
    var onboardingList: Observable<[String]> {
        return _onboardingList.asObservable()
    }
    var buttonViewModelObservable :Observable<OnboardingButtonModel> {
        return _buttonSet.asObservable()
    }
    
    func nextButtonTapped (){
        scrollToNextPage()
    }
    func previousButtonTapped (){
        scrollToPreviousPage()
    }
    func skipButtonTapped (){
        completeOnboarding()
    }
    
    func scrollViewDidEndDecelerating(page : Int){
        updateCurrentPage(page)
    }
}


struct OnboardingButtonModel {
    var skipButtonSet : UIColor
    var nextButttonSet : UIColor
    var previousButtonSet : UIColor
    var nextButtonImgSet : UIImage?
}
