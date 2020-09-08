//
//  timeClock.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/9/5.
//

import Foundation

class TimerClock{
    
  enum TimerState{
     case Initial,Start,Stop
  }

var state : TimerState = .Stop
  
  enum TimerFormat{
    static let noHourFormat   = "%02d.%02d"
    static let hourFormat = "%02d.02d.%02d"
  }
  
 var time = ""
    
}
// var milSecondCount = 0

//func updateTime(){
//  milSecondCount += 1
//  let milliSecond = milSecondCount % 100
//  let seconds = (milSecondCount - milliSecond) / 100 % 60
//  let minutes = (milSecondCount - seconds - milliSecond) / 6000 % 3600
//  time = String (format: TemplateTime.timeFormat, minutes,seconds,milliSecond)
// }
  
