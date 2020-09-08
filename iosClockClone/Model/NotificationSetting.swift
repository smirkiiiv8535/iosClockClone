//
//  NotificationSetting.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/9/5.
//

//import Foundation
//import UIKit
//import UserNotifications
//
//
//enum NotificationCategory: String {
//    case AlarmNotification
//}
//
//enum NotificationAction: String {
//    case Snooze, Stop
//}


//    func clockNotification(alarm:Alarm){
//        let content = UNMutableNotificationContent()
//        content.title = "Alarm Notification"
//        content.body = "This is the \(alarm.textLabel) notificaion."
//        content.sound = UNNotificationSound.init(named:UNNotificationSoundName(rawValue: "\(alarm.ringTone).mp3"))
//        content.categoryIdentifier = NotificationCategory.AlarmNotification.rawValue
//        
//        let hour = alarm.time.hour
//        let min = alarm.time.min
//        
//        var identifier = ""
//        var dateComponent = DateComponents()
//        
//        if alarm.repeatStatus.count == 0 {
//            identifier = alarm.uuid
//            dateComponent = DateComponents(calendar: Calendar.current, hour: hour, minute: min, second: 0)
//            
//        } else {
//            for day in alarm.repeatStatus {
//                identifier = alarm.uuid + day.rawValue
//                let weekday = day.index + 1
//                dateComponent = DateComponents(calendar: Calendar.current,hour: hour, minute: min,weekday: weekday)
//                
//            }
//        }
//        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
//        let request = UNNotificationRequest(identifier:identifier, content: content, trigger: trigger)
//        
//        UNUserNotificationCenter.current().add(request) { (error) in
//
//            if error != nil {
//                print("Notificaion Failed")
//            } else {
//                print("Notificaion succeed.")
//            }
//        }
//        
//       }
//        
//   func deleteNotification(alarm: Alarm) {
//        var identifiers = [String]()
//        let content = UNUserNotificationCenter.current()
//        if alarm.repeatStatus.count == 0 {
//            identifiers.append(alarm.uuid)
//        } else {
//            for day in alarm.repeatStatus {
//                identifiers.append(alarm.uuid + day.rawValue)
//            }
//        }
//       content.removePendingNotificationRequests(withIdentifiers: identifiers)
//
//    }
    


