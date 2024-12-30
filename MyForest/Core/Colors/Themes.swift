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
            if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                let currentStyle = windowScene.traitCollection.userInterfaceStyle
                isDarkMode = currentStyle == .dark
                
            }
            print("isDarkMode : \(isDarkMode)")
        }
}
