//
//  ViewExtension.swift
//  WeatherApp
//
//  Created by Павел on 15.03.2021.
//

import UIKit

extension UIView {
    
    func setGradientBackground(ColorOne: UIColor, ColorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [ColorOne.cgColor, ColorTwo.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
