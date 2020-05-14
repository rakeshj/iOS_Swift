//
//  CurrentAndBoadcastModel.swift
//  WeatherNow
//
//  Created by Rakesh Jaiswal on 2/25/1399 AP.
//  Copyright © 1399 Rakesh Jaiswal. All rights reserved.
//

import UIKit

import Alamofire


typealias CurrentAndBoardcastModelResponse = (_ response: WeatherModelList?) -> Void

protocol CurrentAndBroadcastModeProtocol {
//    var currentWeatherModel: WeatherModelList?{get}
//    var boardcastModel: WeatherModelList?{get}
    func getCurrentWetherFromServer(cityName: String, callback: @escaping CurrentAndBoardcastModelResponse)
    func getBroadcostWetherFromServer(cityName: String, callback: @escaping CurrentAndBoardcastModelResponse)
}


//class CurrentAndBoadcastModel: NSObject {
//
//}

public class CurrentAndBoadcastModel: NSObject, CurrentAndBroadcastModeProtocol {
    
    

    
    
    
    var currentWeatherModel: WeatherModelList?
    var boardcastModel: WeatherModelList?

    func getCurrentWetherFromServer(cityName: String, callback: @escaping CurrentAndBoardcastModelResponse){
    
            let api_key =  kOpenWeatherMapAPIKey
            let apiURL =  kCurrentWeatherAPIBaseIURL
            
            let apiURLwithValue = String(format: apiURL, cityName, api_key)
          
            AF.request(apiURLwithValue)
            .validate()
            .responseDecodable(of: WeatherModelList.self) { (response) in
              guard let weatherModelList = response.value else { return }
                self.currentWeatherModel = weatherModelList
                callback(weatherModelList)
                print(weatherModelList.count)
            }
            
        }
    
   
    func getBroadcostWetherFromServer(cityName: String, callback: @escaping CurrentAndBoardcastModelResponse){
            let api_key = kOpenWeatherMapAPIKey
            let apiURL = kBroadcostWeatherAPIBaseIURL
            
            let apiURLwithValue = String(format: apiURL, cityName, api_key)
            

            AF.request(apiURLwithValue)
            .validate()
            .responseDecodable(of: WeatherModelList.self) { (response) in
              guard let weatherModelList = response.value else { return }
                self.boardcastModel = weatherModelList
                callback(weatherModelList)
                print(weatherModelList.count)
            }
            
        }
    
    
}





struct WeatherModelList: Decodable{
    let count: Int
    let list: [WeatherNowModel]

enum CodingKeys: String, CodingKey {
    case count = "cnt"
    case list
}
}

struct WeatherNowModel: Decodable{
    let main: MainModel
    let wind: WindModel
    let weather: [WeatherModel]
    let date: String?
    let city: String?
    
    enum CodingKeys: String, CodingKey {
        case main
        case wind
        case weather
        case date = "dt_txt"
        case city = "name"
    }
    
}

struct WeatherModel: Decodable{
    let id: Int
    let tempDescription: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case tempDescription = "description"
    }
    
}

struct WindModel: Decodable{
    let speed: Double
//    let degree: Int
//
     enum CodingKeys: String, CodingKey {
        case speed
       // case degree
    }
}


struct MainModel: Decodable{
    let humidity: Int
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double

    enum CodingKeys: String, CodingKey {
        case humidity
        case temp
        case feels_like
        case temp_min
        case temp_max
    }
    
}


