//  stopWatch.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/8/30.

import Foundation
class Stopwatch {
    
  enum TimerState{
      case initial,valid,invalid
  }
  var state : TimerState = .initial
    
  enum TemplateTime{
    static let timeFormat   = "%02d:%02d.%02d"
    static let defaultTime  = "00:00.00"
  }
    
   var time = ""
   var milSecondCount = 0

  func updateTime(){
    milSecondCount += 1
    let milliSecond = milSecondCount % 100
    let seconds = (milSecondCount - milliSecond) / 100 % 60
    let minutes = (milSecondCount - seconds - milliSecond) / 6000 % 3600
    time = String (format: TemplateTime.timeFormat, minutes,seconds,milliSecond)
   }
    
    var laps:[String]=[]
    
    func add(){
        laps.insert(time, at: 0)
    }
    
    func start(){
         state = .valid
       }
    
    func stop(){
         state = .invalid
     }

  func reset(){
     laps.removeAll()
     milSecondCount = 0
     state = .initial
     time = TemplateTime.defaultTime
   }
}
