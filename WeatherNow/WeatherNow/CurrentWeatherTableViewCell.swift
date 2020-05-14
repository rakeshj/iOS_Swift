//
//  CurrentWeatherTableViewCell.swift
//  WeatherNow
//
//  Created by Rakesh Jaiswal on 2/25/1399 AP.
//  Copyright © 1399 Rakesh Jaiswal. All rights reserved.
//

//Current Temperature: 25 ℃
//Min Temperature: 25 ℃
//Maximum Temperature: 25 ℃
//Wind Speed: 200 Mile Per Hour
//Description: Fog

import UIKit
//weatherTableViewCell
//currentweaterSeague
class CurrentWeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var cityAndDateTimeLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var minimumTepLabel: UILabel!
    @IBOutlet weak var maximumTempLabel: UILabel!
    
    @IBOutlet weak var tempDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
