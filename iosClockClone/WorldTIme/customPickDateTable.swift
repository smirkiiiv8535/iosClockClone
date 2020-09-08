//
//  customPickDateTable.swift
//  iosClockClone
//
//  Created by 林祐辰 on 2020/9/3.
//

import UIKit


class customPickDateTable: UIViewController{


    @IBOutlet weak var zoneTable: UITableView!
    
    var locations = TimeZone.knownTimeZoneIdentifiers
    var searchController: UISearchController!
    
    var collectCityLetter = [String]() // 原本儲存資料的抬頭
    var showCityNames = [String]() // 儲存SearchBar 所搜尋的城市陣列
  
    var selectCity:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleSearchController()
        handleTimeZoneForSection()
        handleBackground()
        zoneTable.delegate = self
        zoneTable.dataSource = self
        zoneTable.reloadData()
    }
    
    func handleTimeZoneForSection(){
        
// 其實在源頭就能將傳來的時區名整理成城市,  但是我為了在下個頁面好處理時間  (利用時區ID轉時間) 所以沒在這裡處理
        
//        let allCities = locations.compactMap {
//            String($0.split(separator: "/").last!)
//       }
        
        let groupedCity = Dictionary(grouping: locations,by: {String($0.first!)})
        collectCityLetter = groupedCity.keys.sorted()
    }
    
    func handleBackground(){
        navigationController?.navigationBar.barTintColor = .tabBarColor
        navigationController?.navigationBar.tintColor = .tabBarTintColor
        zoneTable.sectionIndexBackgroundColor = .backgroundColor
        zoneTable.sectionIndexColor = .tabBarTintColor
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? timeZoneCell, let indexPath = zoneTable.indexPath(for: cell){
              if (searchController.isActive) {
                  selectCity  = showCityNames[indexPath.row]
                   } else {
                 selectCity = locations[indexPath.row]
            }
          }
    }
}

// 處理表格
extension customPickDateTable :UITableViewDelegate,UITableViewDataSource{

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return collectCityLetter.map{$0}
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchController.isActive){
          return showCityNames.count
        }else{
        return locations.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeZone", for: indexPath) as? timeZoneCell

        if (searchController.isActive)  {
           cell?.timeZoneLabel.text = showCityNames[indexPath.row]
          return cell!
       } else {
           cell?.timeZoneLabel.text = locations[indexPath.row]
           return cell!
      }
  }
    
}

//  處理搜尋欄功能
extension customPickDateTable :UISearchResultsUpdating{
    
    func handleSearchController(){
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.searchBarStyle = .prominent
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
         UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchString = searchController.searchBar.text else{return}
        showCityNames = locations.filter{$0.contains(searchString)}
        zoneTable.reloadData()
        
   }
}
