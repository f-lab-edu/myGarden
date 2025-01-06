//
//  ViewModel.swift
//  MyGarden
//
//  Created by zeze kim on 12/28/24.
//

// 데이터 처리와 비즈니스 로직
import UIKit
import CoreData

class OnboardingViewModel: ObservableObject {
    
    @Published var currentPage: Int = 0
    var onboardingCompleted: (() -> Void)?
    
    var Onboardinglist: [String] = ["img-flowerpot", "img-hand","img-leafs",
                                    "img-flowerpot", "img-hand","img-leafs",]
    
    func updatePageIndex(for scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
    
    func scrollToNextPage(scrollView: UIScrollView) {
        guard currentPage < Onboardinglist.count - 1 else { return }
        currentPage += 1
        let nextOffsetX = CGFloat(currentPage) * scrollView.frame.width
        scrollView.setContentOffset(CGPoint(x: nextOffsetX, y: 0), animated: true)
        
    }
    
    func scrollToPreviousPage(scrollView: UIScrollView) {
        guard currentPage > 0 else { return }
        currentPage -= 1
        let prevOffsetX = CGFloat(currentPage) * scrollView.frame.width
        scrollView.setContentOffset(CGPoint(x: prevOffsetX, y: 0), animated: true)
    }
    func updateButtonColors(nextButton: UIButton, previousButton: UIButton) {
        nextButton.tintColor = currentPage != Onboardinglist.count - 1 ? ColorChart.primary : ColorChart.primaryAsh
        previousButton.tintColor = currentPage > 0 ? ColorChart.primary : ColorChart.primaryAsh
    }
}
