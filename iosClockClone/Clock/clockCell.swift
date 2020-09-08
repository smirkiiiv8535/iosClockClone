//
//  clockCell.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/9/5.
//

import UIKit

class clockCell: UITableViewCell {

    
    @IBOutlet weak var clockTimeLabel: UILabel!
    @IBOutlet weak var clockNameLabel: UILabel!
    @IBOutlet weak var clockDayLabel: UILabel!
    let onOffSwitch = UISwitch()
    override func awakeFromNib() {
        super.awakeFromNib()
        onOffSwitch.isOn = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
