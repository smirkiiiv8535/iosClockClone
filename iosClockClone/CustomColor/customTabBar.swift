//
//  customTabBar.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/8/29.
//

import UIKit

class customTabBar: UITabBarController {

    @IBOutlet weak var customTab: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        customTab.barTintColor = UIColor.tabBarColor
        customTab.tintColor = UIColor.tabBarTintColor
        customTab.unselectedItemTintColor = UIColor.unselectedTbTintColor
    }
    


}
