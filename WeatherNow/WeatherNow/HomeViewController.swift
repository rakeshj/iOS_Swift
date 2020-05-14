//
//  HomeViewController.swift
//  WeatherNow
//
//  Created by Rakesh Jaiswal on 2/24/1399 AP.
//  Copyright © 1399 Rakesh Jaiswal. All rights reserved.
//

import UIKit



class HomeViewController: UIViewController {

    
    // - Constants
    private var locationManager: LocationManager?
    private let currentAndBroadcast: CurrentAndBroadcastModeProtocol = CurrentAndBoadcastModel()
    private let cityModelUtility = CitiModelUtility()
    private var currentCityName = kCurrentCityIfLocationNeedToByPass
    
    @IBOutlet weak var cityNameTextField: UITextField!
    var weatherDataList: WeatherModelList?
    var boardcastDataList: WeatherModelList?
    var isRequestForBroadcast =  false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = kHomeScreenTitle
    }
    
    @IBAction func showWeather(_ sender: UIButton) {
        let enteredCityName = cityNameTextField.text

        if ((enteredCityName?.isEmpty)!){
            showMessage(message: kPleaseEnterTheCityMessage)
            return
        }
        
        let cityNameInArray = enteredCityName?.components(separatedBy: ",")
        
        
        let count = cityNameInArray!.count
        switch count {
        case 0:
            showMessage(message: kPleaseEnterTheCityMessage)
        case 1..<3:
           showMessage(message: kMinimumCityMessage)
        case 7...:
            showMessage(message: kMaximumCityMessage)
        default:
            // get the data from local json and server
          //  showWaitingDialog()
            cityModelUtility.getCityModelFromLocalJSON(cityNameArray: cityNameInArray!) { (response) in
                print(response)
              //  self.dismissWaitingDialog()
                self.currentAndBroadcast.getCurrentWetherFromServer(cityName: response) { (weatherModelList) in
                   // self.dismissWaitingDialog()
                    DispatchQueue.main.async {
                       // print(weatherModelList)
                        self.weatherDataList = weatherModelList
                        self.isRequestForBroadcast = false
                        self.performSegue(withIdentifier: kCurrentSegueName, sender: self)
                        
                    }
                    
                }
            }
           
            
        }
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a new variable to store the instance of PlayerTableViewController
        let destinationVC = segue.destination as! CurrentWeatherTableViewController
        if isRequestForBroadcast{
            destinationVC.weatherDataList = self.boardcastDataList
            destinationVC.isRequestForBroadcast = true
            destinationVC.cityName = self.currentCityName
        }else{
            destinationVC.weatherDataList = self.weatherDataList
            destinationVC.isRequestForBroadcast = false
        }
        
    }
    
    func showWaitingDialog(){
        let alert = UIAlertController(title: nil, message: kPleaseWaitMessage, preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style =  UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func dismissWaitingDialog(){
        dismiss(animated: false, completion: nil)
    }
   
    func showMessage(message: String){
        let alert = UIAlertController(title: kAlertTitel, message: message, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: kOkCaption, style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showForecast(_ sender: Any) {
        if isLocationNeedToByPass == false{
            self.locationManager = LocationManager()
            showWaitingDialog()
            getCurrentCity()
        }else{
           getBroadcastDataFromServer()
        }
    }
    
    
    func getBroadcastDataFromServer(){
        currentAndBroadcast.getBroadcostWetherFromServer(cityName: currentCityName) { (model) in
                   //print( model)
                   self.boardcastDataList = model
                   self.isRequestForBroadcast = true
                   DispatchQueue.main.async {
                        self.performSegue(withIdentifier: kCurrentSegueName, sender: self)
                   }
               }
    }

    
    func getCurrentCity(){
        guard let exposedLocation = self.locationManager?.exposedLocation else {
            dismissWaitingDialog()
           showMessage(message: kSelectGPSLocationForSimulatorMessage)
            return
        }
        
        self.locationManager?.getPlace(for: exposedLocation) { placemark in
            guard let placemark = placemark else { return }

            
            var output = kLocaitonLogMessage
            if let country = placemark.country {
                output = output + "\n\(country)"
            }
            if let state = placemark.administrativeArea {
                output = output + "\n\(state)"
            }
            if let town = placemark.locality {
                output = output + "\n\(town)"
                self.currentCityName = town
                self.dismissWaitingDialog()
                self.getBroadcastDataFromServer()
            }
            print(output)
        }
        
    }

}
