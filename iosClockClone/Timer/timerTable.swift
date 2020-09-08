//
//  timerTable.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/9/5.
//

import UIKit

class timerTable: UIViewController {

    enum showTimerButton:String{
        case Start,Pause
    }
    
  
    @IBOutlet weak var timerStartBtn: customTimerBtn! {
        willSet{
         newValue.tintColor = .startButtonTxtColor
         newValue.backgroundColor = .startButtonBgColor
        }
  }
    
    
    @IBOutlet weak var cancelBtn: customTimerBtn!{
        willSet{
            newValue.backgroundColor = .lapButtonBgColor
        }
    }
    

    @IBOutlet weak var timerLabel: UILabel!{
        willSet{
        newValue.font = .monospacedDigitSystemFont(ofSize: 90, weight: .thin)
       }
    }
    
 
    @IBOutlet weak var timerClockTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = .tabBarColor
        title = "Timer"
        timerClockTableView.delegate = self
        timerClockTableView.dataSource = self
   
//       datePicker.setValue(UIColor.white, forKeyPath: "textColor")
    }
    
    
    
    
    func switchTimerButtons(state: TimerClock.TimerState){
        switch state {
        case .Stop:
            timerStartBtn.setTitle( showTimerButton.Pause.rawValue, for: .normal)
            timerStartBtn.backgroundColor = .tabBarColor
            timerStartBtn.tintColor = .pauseTxtColor
            cancelBtn.isEnabled = true
        case .Start:
            timerStartBtn.setTitle( showTimerButton.Start.rawValue, for: .normal)
            timerStartBtn.backgroundColor = .startButtonBgColor
            timerStartBtn.tintColor = .startButtonTxtColor
            cancelBtn.isEnabled = true
        case .Initial:
            timerStartBtn.setTitle( showTimerButton.Start.rawValue, for: .normal)
            timerStartBtn.backgroundColor = .startButtonBgColor
            timerStartBtn.tintColor = .startButtonTxtColor
            cancelBtn.isEnabled = false
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension timerTable:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seeRing", for: indexPath) as? timerCell
        cell?.overrideUserInterfaceStyle = .dark
        return cell!
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}
