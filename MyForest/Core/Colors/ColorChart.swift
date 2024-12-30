//
//  ColorChart.swift
//  MyForest
//
//  Created by zeze kim on 12/28/24.
//

import UIKit


enum ColorChart {
    
    // primary 색상
    static var primary: UIColor {
        return Themes.isDarkMode ? UIColor(hex: "99BC85") : UIColor(hex: "BFD8AF")
    }
    
    // secondary 색상
    static var secondary : UIColor {
        return Themes.isDarkMode ? UIColor(hex: "9DBC98") : UIColor(hex: "BFD8AF")
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
        return UIColor(hex: "86D293")
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
