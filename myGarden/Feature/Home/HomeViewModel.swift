//
//  HomeViewModel.swift
//  myGarden
//
//  Created by zeze kim on 1/6/25.
//

import UIKit

class HomeViewModel {
    
    
    func reset() { // 온보딩 테스트용으로 생성
        print("reset")
        UserDefaults.standard.removeObject(forKey: "isFirstTime")
        UserDefaults.standard.synchronize()
        print("\(UserDefaults.standard.removeObject(forKey: "isFirstTime"))")
    }
    
}
