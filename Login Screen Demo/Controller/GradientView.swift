//
//  GradientView.swift
//  Login Screen Demo
//
//  Created by Артем Сергеев on 26.06.2022.
//

import UIKit

class GradientView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.systemGreen.cgColor, UIColor.systemYellow.cgColor]
        layer.addSublayer(gradient)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
