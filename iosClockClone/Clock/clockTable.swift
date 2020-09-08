//
//  clockTable.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/9/5.
//

import UIKit

class clockTable: UITableViewController {

    
    @IBOutlet var clocks: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
  //  var collectAlarm = [Alarm]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
        navigationController?.navigationBar.barTintColor = .tabBarColor
        navigationController?.navigationBar.tintColor = .tabBarTintColor
        
        //  編輯 tableView時 可以被選取 (進下一個畫面)
        clocks.allowsSelectionDuringEditing = true
        
    }
    
    
    
    @IBAction func editClocks(_ sender: UIBarButtonItem) {
        if clocks.isEditing {
            clocks.isEditing = false
            editButton.title = "Edit"
        }
        else {
            clocks.isEditing = true
            editButton.title = "Done"
        }
    }
    
    
    @IBAction func addClocks(_ sender: UIBarButtonItem) {
        if clocks.isEditing {clocks.isEditing = false}
        
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 60
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clocks", for: indexPath)as?clockCell
        return cell!
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

 
  
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
        
//          NotificationPush().deleteNotification(alarm: alarmArray[indexPath.row])
//            collectAlarm.remove(at: indexPath.row)
//          AlarmData.saveData(alarmArray: alarmArray)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
