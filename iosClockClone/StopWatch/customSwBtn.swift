
//  customSwBtn.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/8/30.
//


import UIKit

// Reference : https://gist.github.com/toddhopkinson/893fff926f3f1a549c08f41acd05a5ed
// https://reurl.cc/KjrELp

class StopWatchButton:UIButton{
    
    let stopwWatchBtnLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(ovalIn: CGRect(x: 3, y: 2.7, width:78.5, height: 78.5)).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 1
        layer.strokeColor = UIColor.backgroundColor.cgColor
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
   
    func initialize(){
        layer.cornerRadius = frame.height / 2
        layer.addSublayer(self.stopwWatchBtnLayer)
    }
    
}


