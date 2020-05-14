//
//  CurrentWeatherTableViewController.swift
//  WeatherNow
//
//  Created by Rakesh Jaiswal on 2/25/1399 AP.
//  Copyright © 1399 Rakesh Jaiswal. All rights reserved.
//

import UIKit

class CurrentWeatherTableViewController: UITableViewController {

   var weatherDataList: WeatherModelList?
    var isRequestForBroadcast: Bool? 
    var cityName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = isRequestForBroadcast! ? cityName : kCurrentWeatherReportTitle
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.weatherDataList?.list.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.00
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kWeatherTableViewCell, for: indexPath) as! CurrentWeatherTableViewCell

        
        
        
        let weatherModel = weatherDataList?.list[indexPath.row]
        let model = weatherModel?.weather[0]
        let weatherDescription = model?.tempDescription as! String

        cell.cityAndDateTimeLabel.text = self.isRequestForBroadcast! ?  weatherModel?.date : weatherModel?.city 
        cell.currentTempLabel.text = String(format: kCurrentTempText, weatherModel?.main.temp ?? 0)
        cell.minimumTepLabel.text =  String(format: kMinTempText, weatherModel?.main.temp_min ?? 0)
        cell.maximumTempLabel.text = String(format: kMaxTempText, weatherModel?.main.temp_max ?? 0)
        cell.windSpeedLabel.text   = String(format: kWindSpeedText, weatherModel?.wind.speed ?? 0)
        cell.tempDescLabel.text = String(format: kDescText, weatherDescription)
    

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

}
