//
//  showWorldTime.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/9/6.
//

import UIKit

class showWorldTime: UIViewController {

    @IBOutlet weak var showTimeTable: UITableView!
    @IBOutlet weak var editBtn: UIBarButtonItem!

    var city : String = ""
    var cityToDisplay : [String] = []
    
    var passedLocation: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .tabBarColor
        navigationController?.navigationBar.tintColor = .tabBarTintColor
        showTimeTable.delegate = self
        showTimeTable.dataSource = self
        showTimeTable.allowsMultipleSelectionDuringEditing = true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        renderTable()
    }
    
    
    func renderTable(){
        if passedLocation.count == 0{
            showTimeTable.isHidden = true
        }else{
            showTimeTable.isHidden = false
        }
    }

    
    @IBAction func editWorldClock(_ sender: Any) {
        if showTimeTable.isEditing {
            showTimeTable.isEditing = false
            editBtn.title = "Edit"
        }
        else {
            showTimeTable.isEditing = true
            editBtn.title = "Done"
        }
    }
    
    @IBAction func unwindToshowWorldTime(_ unwindSegue: UIStoryboardSegue) {
        if let sourceController = unwindSegue.source as? customPickDateTable, let selectCity = sourceController.selectCity {
            
            passedLocation.insert(selectCity, at: 0)
            // 因為要做整理的動作 所以先設立一個全域變數 city , 將selectCity存入
            city = selectCity
            // 將傳來的時區名整理成城市  Ex : "Asia/Taipei" 轉成 "Taipei"
            let locations = selectCity.split(separator: "/").last!
            cityToDisplay.insert(String(locations), at: 0)

        let indexPath = IndexPath(row: 0, section: 0)
        showTimeTable.insertRows(at: [indexPath], with: .automatic)
    }

  }
}

extension showWorldTime: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passedLocation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showWorldTime", for: indexPath) as? showTimeZoneCell
        cell?.placeCell.text = cityToDisplay[indexPath.row]
        cell?.invisibleCell.text = passedLocation[indexPath.row]
        // 重新排列的符號遇到深背景色（如黑色) 會被覆蓋 , 所以要調整顯示模式為夜間模式 ,這樣重新排列的符號會變深灰色
        cell?.overrideUserInterfaceStyle = .dark
        return cell!
    }
    
    //  移動 tableCell這個動作
   func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //  移動 tableCell的實際順序
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        passedLocation.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
  
    // 刪除tableCell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            passedLocation.remove(at: indexPath.row)
            showTimeTable.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
