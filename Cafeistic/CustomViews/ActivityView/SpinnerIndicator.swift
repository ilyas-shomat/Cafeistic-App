//
//  SpinnerIndicator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 27.04.2021.
//

import Foundation
import UIKit

final class SpinnerIndicator: UIView {
    
    private(set) var animating: Bool = false {
        didSet {
            
        }
    }
    
    private let circleLayer: CAShapeLayer = {
        let layer  = CAShapeLayer()
        layer.lineWidth = 2.5
        layer.fillColor = nil
        layer.strokeColor = UIColor.white.cgColor
        return layer
    }()
    
    private let strokeEndAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        let group = CAAnimationGroup()
        group.duration = 1.5
        group.repeatCount = MAXFLOAT
        group.animations = [animation]
        
        return group
    }()
    
    private let strokeStartAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.beginTime = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        let group = CAAnimationGroup()
        group.duration = 1.5
        group.repeatCount = MAXFLOAT
        group.animations = [animation]
        
        return group
    }()
    
    private let rotationAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = CGFloat.pi * 2
        animation.duration = 2
        animation.repeatCount = MAXFLOAT
        return animation
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2 - circleLayer.lineWidth / 2
        
        let startAngle = (-CGFloat.pi) / 2
        let endAngle = startAngle + (CGFloat.pi) * 2
        let path = UIBezierPath(arcCenter: .zero,
                                radius: radius,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        circleLayer.position = center
        circleLayer.path = path.cgPath
    }
    
    private func setupViews() {
        layer.addSublayer(circleLayer)
        updateAnimation()
    }
    
    func startAnimating() {
        animating = true
    }
    
    func stopAnimating() {
        animating = false
    }
    
    private func updateAnimation() {
        if animating {
            circleLayer.add(strokeEndAnimation, forKey: "strokeEnd")
            circleLayer.add(strokeStartAnimation, forKey: "strokeStart")
            circleLayer.add(rotationAnimation, forKey: "rotation")
        } else {
            circleLayer.removeAnimation(forKey: "strokeEnd")
            circleLayer.removeAnimation(forKey: "strokeStart")
            circleLayer.removeAnimation(forKey: "rotation")
        }
    }
}
