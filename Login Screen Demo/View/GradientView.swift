//
//  GradientView.swift
//  Login Screen Demo
//
//  Created by Артем Сергеев on 26.06.2022.
//

import UIKit

class GradientView: UIView {
    
    @IBInspectable private var startColor: UIColor? {
        didSet {
            setUpGradientColor()
        }
    }
    
    @IBInspectable private var endColor: UIColor? {
        didSet {
            setUpGradientColor()
        }
    }
    
    private let gradientLayer = CAGradientLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .red
       setUpGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setUpGradient() {
        self.layer.addSublayer(gradientLayer)
        setUpGradientColor()
    }
    
    private func setUpGradientColor() {
        if let startColor = startColor, let endColor = endColor {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
}
