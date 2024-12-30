//
//  ViewModel.swift
//  MyForest
//
//  Created by zeze kim on 12/28/24.
//

// 데이터 처리와 비즈니스 로직
import UIKit
import Combine
import SwiftUICore
import CoreData

class OnboardingViewModel: ObservableObject {
    
    @Published var isFirstTimeUser: Bool = true
    @Published var currentPage: Int = 0
    var onboardingCompleted: (() -> Void)?
    
    private(set) var Onboardinglist: [OnboardingModel] = [
        OnboardingModel(imageName: "img-flowerpot", title: "안녕하세요", description: "first"),
        OnboardingModel(imageName: "img-hand", title: "알람", description: "second"),
        OnboardingModel(imageName: "img-leafs", title: "마지막", description: "last")
    ]
    
    func getCurrentSlide() -> OnboardingModel {
        return Onboardinglist[currentPage]
    }
    
    func moveToNextPage() {
        if currentPage < Onboardinglist.count - 1 {
            currentPage += 1
        }
    }
    
    func moveToPreviousPage() {
        if currentPage > 0 {
            currentPage -= 1
        }
    }
    func completeOnboarding(){
        isFirstTimeUser = false
    }

}
