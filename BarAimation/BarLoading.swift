//
//  BarLoading.swift
//  testi
//
//  Created by Jawad Ali on 08/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
@IBDesignable public class BarLoading: UIView {
    
    //MARK:- Properties
    public var speed: Double = 2 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var width:CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    //MARK:- Views
    private lazy var upShape : CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.lineJoin = .round
        return shape
    }()
    
    private lazy var downShape : CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.lineJoin = .round
        return shape
    }()
    
    private lazy var trackShape : CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.strokeColor = UIColor.red.cgColor
        shape.fillColor = UIColor.clear.cgColor
        return shape
    }()
    
    //MARK:- Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        controlDidLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        controlDidLoad()
    }
    
    //MARK:- Life cycle
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        _ =  [trackShape, upShape, downShape].map{ $0.lineWidth = width }
        
        let radius = bounds.width/10
        
        trackShape.path = drawShape(with: radius, track: .full)
        upShape.path = drawShape(with: radius, track: .upper)
        downShape.path = drawShape(with: radius, track: .loswer)
    }
    
    private func controlDidLoad(){
        layer.addSublayer(trackShape)
        layer.addSublayer(upShape)
        layer.addSublayer(downShape)
        
        upShape.strokeEnd = 0
        downShape.strokeEnd = 0
    }
    
   
       private func setUpConstraints(with view: UIView) {
           NSLayoutConstraint.activate([
               self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
               self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
               self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               self.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
       }
    
}

 //MARK:- Start Stop Animation
public extension BarLoading {
      func startAnimation(in view : UIView , isConstraintsSet:Bool = false) {
        upShape.strokeAnimation(duration: speed, from: 0, to: 1)
        downShape.strokeAnimation(duration: speed, from: 0, to: 1)
        
        view.addSubview(self)
              layoutIfNeeded()
              if !isConstraintsSet {
                  setUpConstraints(with: view)
              }
    }
    
    func stopAnimation() {
        upShape.removeAllAnimations()
        downShape.removeAllAnimations()
         self.removeFromSuperview()
    }
}

private extension BarLoading {
    func drawShape(with radius: CGFloat, track:Tracks) -> CGPath {
        let bezierPath = UIBezierPath()
        
        let centerA = CGPoint(x: radius, y: radius)
        
        bezierPath.append(drawCircle(at: centerA, radius: radius, track: track))
        bezierPath.addLine(to: CGPoint(x: radius * 4, y: radius))
        bezierPath.append(drawCircle(at: CGPoint(x: radius * 5, y: radius), radius: radius, track: track))
        bezierPath.addLine(to: CGPoint(x: radius * 8, y: radius))
        bezierPath.append(drawCircle(at: CGPoint(x: radius * 9, y: radius), radius: radius, track: track))
        
        return bezierPath.cgPath
    }
    
    func drawCircle(at center:CGPoint, radius:CGFloat, track:Tracks)-> UIBezierPath {
        UIBezierPath(arcCenter:center , radius: radius, startAngle: track.initialAngel.degreesToRadians, endAngle: 360.degreesToRadians, clockwise: track.isClockWise)
    }
    
}
