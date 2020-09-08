//
//  showTimeZoneCell.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/9/6.
//

import UIKit

class showTimeZoneCell: UITableViewCell {

    @IBOutlet weak var zoneCell: UILabel!
    @IBOutlet weak var placeCell: UILabel!
    @IBOutlet weak var timeCell: UILabel!
    @IBOutlet weak var invisibleCell: UILabel!
    
    var time24HoursBool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setTime), userInfo: nil, repeats: true)
    }
        
    
        @objc func setTime(){
            timeCell.text = getTime()
            time24HoursBool = UserDefaults.standard.bool(forKey: "timeBool")
            zoneCell.text = getZone()
        }
        
        
        func getTime()->String{
            
            var time12hours = ""
            var time24hours = ""
            
            if invisibleCell.text != ""{
                let locale = NSLocale.current
                let formatter : String = DateFormatter.dateFormat(fromTemplate: "j", options:0, locale:locale)!
                if formatter.contains("a") {
                    //phone is set to 12 hours
                    // Time 12 hour format
                    let formatter12 = DateFormatter()
                    formatter12.timeStyle = .short
                    formatter12.timeZone = TimeZone(identifier: invisibleCell.text!)
                    let timeNow = Date()
                    time12hours = formatter12.string(from: timeNow)
                } else {
                    //phone is set to 24 hours
                    // Time 24 hour format
                    time24HoursBool = true
                    let formatter24 = DateFormatter()
                    formatter24.timeStyle = .short
                    formatter24.timeZone = TimeZone(identifier: invisibleCell.text!)
                    let timeNow = Date()
                    time24hours = formatter24.string(from: timeNow)
                }
            }
            
            if time24HoursBool{
                return time24hours
            }
            else{
                return time12hours
            }
        }

    func getZone() -> String {
        var returnString = ""
        var timeString = ""

        if invisibleCell.text != "" {

            let formatter = DateFormatter()
            formatter.timeStyle = .long
            formatter.timeZone = TimeZone(identifier: invisibleCell.text!)

            let timeNow = Date()
            timeString = formatter.string(from: timeNow)
            let index = timeString.index(timeString.endIndex,offsetBy: -5)
            returnString = String(timeString[index...])
              //  timeString.substring(from: index)
            print(returnString)
        }
       return returnString
    }
    
        override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
            
 }


