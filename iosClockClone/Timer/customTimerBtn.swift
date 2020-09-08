//
//  customTimerBtn.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/9/8.
//

import Foundation
import UIKit


class customTimerBtn:UIButton{
    
    
    let timerLayer : CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(ovalIn: CGRect(x: 3, y: 2.5, width: 78.5, height: 78.5)).cgPath
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
        layer.addSublayer(self.timerLayer)
    }
}




