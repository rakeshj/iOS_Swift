//
//  CitiModelUtility.swift
//  WeatherNow
//
//  Created by Rakesh Jaiswal on 2/24/1399 AP.
//  Copyright © 1399 Rakesh Jaiswal. All rights reserved.
//

import UIKit


struct RequestCityCodable:Codable {
       let cities:[CityWithName]
   }
   
   struct CityWithName:Codable {
       let name:String
       let id:Int
   }

extension Decodable {

    static func fromJSON<T:Decodable>(_ fileName: String, fileExtension: String="json", bundle: Bundle = .main) throws -> T {
        guard let url = bundle.url(forResource: fileName, withExtension: fileExtension) else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorResourceUnavailable)
        }

        let data = try Data(contentsOf: url)

        return try JSONDecoder().decode(T.self, from: data)
    }
}


class CitiModelUtility: NSObject {
    
    var cityArray:[CityWithName]?
    func getCityModelFromLocalJSON(cityNameArray: [String], callback: @escaping (_ cityName: String) -> Void) {
        var citiesId = ""
        do{
        let result =  try RequestCityCodable.fromJSON("city_list") as RequestCityCodable?
            cityArray = result?.cities.compactMap{$0}
            cityArray?.filter({ (model) -> Bool in
                       
                       var flag = false
                var localNameArray = cityNameArray
                for (index, name) in localNameArray.enumerated(){
                    if model.name.lowercased() == name.lowercased().trimmingCharacters(in: CharacterSet.whitespaces){
                               flag = true
                            if citiesId.isEmpty{
                                citiesId = String(model.id)
                            }else{
                                citiesId = citiesId + "," + String(model.id)
                            }
                            localNameArray.remove(at: index)
                               break
                           }
                       }
                       return flag
                   })
            
            
            
            
           // print(cityArray)
            
            
        }catch{
            print("Error")
        }
        
        callback(citiesId)
    }
    
}
