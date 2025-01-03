//
//  ColorChart.swift
//  MyGarden
//
//  Created by zeze kim on 12/28/24.
//

import UIKit
import SwiftUI


enum ColorChart {

    
    
    
    // primary 색상
    static var primary: UIColor {
        return Themes.isDarkMode ? UIColor(hex: "3E7B27") : UIColor(hex: "5CB338")
    }
    
    static var primaryAsh: UIColor {
        return Themes.isDarkMode ? UIColor(hex: "A5B68D") : UIColor(hex: "85A98F")
    }
    // secondary 색상
    static var secondary : UIColor {
        return Themes.isDarkMode ? UIColor(hex: "638C6D") : UIColor(hex: "BFD8AF")
    }
    
    // background 색상
    static var background: UIColor {
        return Themes.isDarkMode ? UIColor(hex: "333333") : UIColor(hex: "FFFFFF")
    }
    
    // text 색상
    static var text: UIColor {
        return Themes.isDarkMode ? UIColor.white : UIColor.black
    }
    // textFieldBackground 색상
    static var textFieldBackground: UIColor {
        return Themes.isDarkMode ? UIColor(hex: "333333") : UIColor(hex: "F5F5F5")
    }
    
    // textFieldBorder 색상
    static var textFieldBorder: UIColor {
        return Themes.isDarkMode ? UIColor(hex: "555555") : UIColor(hex: "BFD8AF")
    }
    
    // textFieldFocus 색상
    static var textFieldFocus: UIColor {
        return Themes.isDarkMode ? UIColor(hex: "1E88E5") : UIColor(hex: "1976D2")
    }
    
    // border 색상
    static var border: UIColor {
        return Themes.isDarkMode ? UIColor(hex: "9DBC98") : UIColor(hex: "99BC85")
    }
    
    // border background 색상
    static var borderBackground: UIColor {
         return Themes.isDarkMode ? UIColor(hex: "444444") : UIColor(hex: "FFFFFF")
    }
    
    // submit 색상
    static var submit: UIColor {
        return Themes.isDarkMode ? UIColor(hex: "16423C") : UIColor(hex: "0D7C66")
    }
    
    
    // accent 강조 색상
    static var accent: UIColor {
        return Themes.isDarkMode ? UIColor(hex: "EFB495") : UIColor(hex: "FFCF81")
    }
    
    // placeholder 색상
    static var placeholder: UIColor {
        return Themes.isDarkMode ? UIColor.darkGray : UIColor.lightGray
    }
    
    // success 색상
    static var success: UIColor {
        return Themes.isDarkMode ? UIColor(hex: "117554") : UIColor(hex: "86D293")
    }
    
    // error 색상
    static var error: UIColor {
        return UIColor.red
    }
    
    // warning 색상
    static var warning: UIColor {
        return UIColor.orange
    }
}
