//
//  AppDelegate.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/8/29.
//

import UIKit
import UserNotifications

@UIApplicationMain

    class NotificationSetting:UIResponder,UIApplicationDelegate, UNUserNotificationCenterDelegate {
         
//        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//                   //  操作該 App 或 其它 App時都能收到通知,不用到桌面
//                    UNUserNotificationCenter.current().delegate = self
//
//                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound], completionHandler: { granted, error in
//                        if granted{
//                            print("User Allow")
//                        }
//                        else if error != nil {
//                            print("User don't allow")
//                        }
//                        })
         
//
//            let snoozeAction = UNNotificationAction(identifier: NotificationAction.Snooze.rawValue, title: NotificationAction.Snooze.rawValue, options: [])
//            let stopAction = UNNotificationAction(identifier: NotificationAction.Stop.rawValue, title: NotificationAction.Stop.rawValue, options: [.destructive])
//
//            let category = UNNotificationCategory(identifier: NotificationCategory.AlarmNotification.rawValue, actions: [snoozeAction, stopAction], intentIdentifiers: [], options: [])
            
//            UNUserNotificationCenter.current().setNotificationCategories([category])
            
//            return true

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
        
        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([.sound, .alert])
 
        }
        
        

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


    }

