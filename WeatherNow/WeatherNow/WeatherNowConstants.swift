//
//  WeatherNowConstants.swift
//  WeatherNow
//
//  Created by Rakesh Jaiswal on 2/25/1399 AP.
//  Copyright © 1399 Rakesh Jaiswal. All rights reserved.
//

import Foundation

/*********************************
 This flag is define for testing purpose. It let evaluator to toggle on and off to enable and disable the feature to fetch the data from current location intead of hardcoded value Dubai.....
**************************/
let isLocationNeedToByPass = true


//server configuration and setting parameter
let kOpenWeatherMapAPIKey = "8055ed44852ff9f6bdd149588767388e"
let kBroadcostWeatherAPIBaseIURL = "http://api.openweathermap.org/data/2.5/forecast?q=%@&appid=%@"
let kCurrentWeatherAPIBaseIURL =  "http://api.openweathermap.org/data/2.5/group?id=%@&units=metric&appid=%@"

let kCurrentTempText = "Current Temperature: %.2f ℃"
let kMinTempText =     "Min Temperature: %.2f ℃"
let kMaxTempText =  "Maximum Temperature: %.2f ℃"
let kWindSpeedText = "Wind Speed: %.2f Mile"
let kDescText = "Description: %@"

let kHomeScreenTitle = "Weather Now"
let kCurrentWeatherReportTitle = "Current Weather Report"
let kCurrentCityIfLocationNeedToByPass = "Dubai"
let kCurrentSegueName = "currentweatherSeague"
let kWeatherTableViewCell = "weatherTableViewCell"


//Message 
let kPleaseWaitMessage = "Please wait..."
let kPleaseEnterTheCityMessage = "Please enter the City"
let kMinimumCityMessage = "Minimum 3 city required to proceed"
let kMaximumCityMessage = "Maximum 7 city allowed"
let kSelectGPSLocationForSimulatorMessage = "Kindly select the GPS location if you running the application on simulator"
let kLocaitonLogMessage = "Our location is:"
let kAlertTitel = "Weather Now"
let kOkCaption = "OK"
