//
//  PM+UIButton.swift
//  PhotoMotion
//
//  Created by Sergey Klimov on 27.01.2018.
//  Copyright © 2018 Sergey Klimov. All rights reserved.
//

import UIKit


enum ButtonStyle: String {
    
    case light
    case dark
    
    var mainColor: UIColor {
        switch self {
        case .light:    return .white
        case .dark:     return .black
        }
    }
    var tintColor: UIColor {
        switch self {
        case .light:    return .black
        case .dark:     return .white
        }
    }

    var borderColor: UIColor { return tintColor }
    var backgroundColor: UIColor { return mainColor }
    var borderWidth: CGFloat { return 1 }
}

extension UIButton {
    
    @IBInspectable var style: String? {
        set { setupWithStyleNamed(named: newValue) }
        get { return nil }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue  }
        get { return layer.cornerRadius }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor  }
        get { return UIColor(cgColor: layer.borderColor ?? UIColor.white.cgColor) }
    }
    
    private func setupWithStyleNamed(named: String?){
        if let styleName = named, let style = ButtonStyle(rawValue: styleName) {
            setupWithStyle(style: style)
        }
    }
    
    func setupWithStyle(style: ButtonStyle){
        backgroundColor = style.backgroundColor
        tintColor       = style.tintColor
        borderColor     = style.borderColor
        borderWidth     = style.borderWidth
        cornerRadius    = frame.height / 2
    }
}
