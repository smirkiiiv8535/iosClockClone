//
//  stopWatchVC.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/8/30.
//

import UIKit

class stopWatchVC: UIViewController{
        
    let stopwatch = Stopwatch()
    var timer : Timer?
    
    var state : Stopwatch.TimerState = .initial
    enum ButtonState:String{
        case Start,Stop,Lap,Reset
    }
    
    @IBOutlet weak var timeLabel: UILabel!{
        willSet{
         newValue.font = .monospacedDigitSystemFont(ofSize: 90, weight: .thin)
        }
    }
    @IBOutlet weak var lapButton: StopWatchButton!{
        willSet{
            newValue.backgroundColor = .lapButtonBgColor
        }
    }
    @IBOutlet weak var initStartBtn: StopWatchButton!{
        willSet{
            newValue.backgroundColor = .startButtonBgColor
            newValue.tintColor = .startButtonTxtColor
        }
    }
    
    @IBOutlet weak var timerTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .tabBarColor
        title = "StopWatch"
        timerTableView.dataSource = self
    }
    
    
    @IBAction func iniStartBtnPressed(_ sender: StopWatchButton) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(tapInitBtn), userInfo: nil, repeats: true)
            stopwatch.start()
        } else {
            stopwatch.stop()
            timer?.invalidate()
            timer = nil
        }
        
        switchStopWatchButtons(state: stopwatch.state)
    }
    
    @objc func tapInitBtn(){
        stopwatch.updateTime()
        timeLabel.text = stopwatch.time
        timerTableView.cellForRow(at: .init(row: 0, section: 0))?.detailTextLabel?.text = stopwatch.time
    }
     
    
    @IBAction func lapBtnPressed(_ sender: StopWatchButton) {
        switch stopwatch.state {
        case .initial:
            fallthrough
        case .valid:
            stopwatch.add()
            timerTableView.reloadData()
        case .invalid:
            stopwatch.reset()
            timerTableView.reloadData()
            timeLabel.text = String(Stopwatch.TemplateTime.defaultTime)
            switchStopWatchButtons(state: .initial)
        }
    }

    func switchStopWatchButtons(state: Stopwatch.TimerState){
        switch state {
        case .valid:
            initStartBtn.setTitle( ButtonState.Stop.rawValue, for: .normal)
            lapButton.setTitle( ButtonState.Lap.rawValue, for: .normal)
            initStartBtn.backgroundColor = .stopButtonBgColor
            initStartBtn.tintColor = .stopButtonTxtColor
            lapButton.alpha = 1
        case .invalid:
            initStartBtn.setTitle( ButtonState.Start.rawValue, for: .normal)
            lapButton.setTitle( ButtonState.Reset.rawValue, for: .normal)
            initStartBtn.backgroundColor = .startButtonBgColor
            initStartBtn.tintColor = .startButtonTxtColor
        case .initial:
           lapButton.setTitle( ButtonState.Start.rawValue, for: .normal)
           lapButton.setTitle( ButtonState.Lap.rawValue, for: .normal)
           initStartBtn.backgroundColor = .startButtonBgColor
           initStartBtn.tintColor = .startButtonTxtColor
           lapButton.alpha = 0.6
        }
    }

}


 extension stopWatchVC : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch stopwatch.state {
        case .initial:
            return 0
        default :
            return stopwatch.laps.count
    
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "timerCell", for: indexPath) as? stopWatchCell
        cell?.lapLabel.text = "Lap \(stopwatch.laps.count - indexPath.row)"
        
        if indexPath.row != 0 {
            cell?.recordTimeLabel.text = stopwatch.laps[indexPath.row]
            cell?.recordTimeLabel.font = .monospacedDigitSystemFont(ofSize: 17, weight: .regular)
        } else {
            cell?.recordTimeLabel?.text = stopwatch.time
        }
        return cell!
    }
    
 }
    
