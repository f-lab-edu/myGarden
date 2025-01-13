//
//  ColorChart.swift
//  MyGarden
//
//  Created by zeze kim on 12/28/24.
//

import UIKit
import SwiftUI


enum ColorChart {
    // Primary 색상
    static var primary: UIColor {
        dynamicColor(dark: "248c5a", light: "118B50")
    }
    

    static var primaryAsh: UIColor {
        dynamicColor(dark: "3a5e45", light: "6aab7c")
    }

    // Secondary 색상
    static var secondary: UIColor {
        dynamicColor(dark: "424a3d", light: "BFD8AF")
    }

    // Background 색상
    static var background: UIColor {
        dynamicColor(dark: "2e2e2e", light: "FFFFFF")
    }
    
    static var backgroundLight: UIColor {
        dynamicColor(dark: "4f4f4f", light: "e6e6e6")
    }

    // Text 색상
    static var text: UIColor {
        dynamicColor(dark: "FFFFFF", light: "000000")
    }

    // TextField 색상
    static var textFieldBackground: UIColor {
        dynamicColor(dark: "808080", light: "F5F5F5")
    }

    static var textFieldBorder: UIColor {
        dynamicColor(dark: "464f41", light: "BFD8AF")
    }

    static var textFieldFocus: UIColor {
        dynamicColor(dark: "1E88E5", light: "1976D2")
    }

    // Border 색상
    static var border: UIColor {
        dynamicColor(dark: "9DBC98", light: "99BC85")
    }

    static var borderBackground: UIColor {
        dynamicColor(dark: "444444", light: "FFFFFF")
    }

    // Submit 색상
    static var submit: UIColor {
        dynamicColor(dark: "16423C", light: "0D7C66")
    }

    // Accent 강조 색상
    static var accent: UIColor {
        dynamicColor(dark: "C62E2E", light: "B8001F")
    }

    // Placeholder 색상
    static var placeholder: UIColor {
        UIColor { $0.userInterfaceStyle == .dark ? .darkGray : .lightGray }
    }

    // Success 색상
    static var success: UIColor {
        dynamicColor(dark: "117554", light: "86D293")
    }

    // Error 색상
    static var error: UIColor { .red }

    // Warning 색상
    static var warning: UIColor { .orange }
}

extension ColorChart {
    private static func dynamicColor(dark: String, light: String) -> UIColor {
        UIColor { $0.userInterfaceStyle == .dark ? UIColor(hex: dark) : UIColor(hex: light) }
    }
}

