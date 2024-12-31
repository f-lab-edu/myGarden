//
//  Themes.swift
//  MyForest
//
//  Created by zeze kim on 12/28/24.
//
import UIKit

enum Themes {
    static var isDarkMode: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isDarkMode")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isDarkMode")
        }
    }
    
    static func updateTheme() {
        let currentStyle = UITraitCollection.current.userInterfaceStyle
        isDarkMode = (currentStyle == .dark)
        print("currentStyle : \(currentStyle)")
        UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
        
    }
}
