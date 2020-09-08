//
//  AlarmSetting.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/9/5.
//

import Foundation

// Still Under Construction (Alarm Setting)

//struct AlarmSetting {
//
//    enum DaysOfWeek: String, CaseIterable {
//        case Sunday, Monday, Tuesday, Wednesday, Thusday, Friday, Saturday
//        var index: Int { DaysOfWeek.allCases.firstIndex(of: self)! }
//    }
//
//    enum daySet:String {
//        case Never, Everday, Weekend, Weekday
//    }
//
//    static let ringTone = ["Iphone","Iphone5","Iphone7","IphoneX","Radar","Reflection"]
//
//    static let repeatArray: [String] = DaysOfWeek.allCases.map { $0.rawValue}
//
//}
//extension Array where Element == AlarmSetting.DaysOfWeek {
//
//    var dateString: String {
//        switch self {
//        case []:
//            return AlarmSetting.daySet.Never.rawValue
//        case [.Sunday, .Monday, .Tuesday, .Wednesday, .Thusday, .Friday, .Saturday]:
//            return AlarmSetting.daySet.Everday.rawValue
//        case [.Sunday, .Saturday]:
//            return "\(AlarmSetting.daySet.Weekend.rawValue)s"
//        case [.Monday, .Tuesday, .Wednesday, .Thusday, .Friday]:
//            return "\(AlarmSetting.daySet.Weekday.rawValue)s"
//        default:
//            return map{ $0.rawValue.prefix(3) }.joined(separator: ",")
//        }
//    }
//
//}
