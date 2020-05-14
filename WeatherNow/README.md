Project Name: WeatherNow
Developed in: Swift 5.1
Xcode Vesrsion: 11.4.1



Application Feature:
Once user launch the application, he/she landup to Home screen. Home screen comprises the below feature. 

1) Text box to enter the City name. This box has a limitation which not let user to enter less than three city and more than 7.
2) User can enter the city name and see the current whether report of by pressing the "Show Current Weather Button".

Show Current City Broadcast:
1) It will use the device GPS and fetch the city name based on you current Latitude and Longitude. 
2) Ater ascertaining the city it fetch the forecast report of 5 days in 3 hours intervwal.

To test the Show current City Broadcast:
1) Go to WeatherNowConstants.swift and enable/disable the below variable:
let isLocationNeedToByPass = true

   In order to test current city feature, we have to select the GPS location from Xcode and click the button. Please make sure the above flag isLocationNeedToByPass should be false and selection of GPS location should be done to test this feature. 

   To demonstrate the feature with fetching the current location, I have introduced the isLocationNeedToByPass flag.If you make it false it will fetch the broadcast detail for Dubai which is hardcoded in Constants file. 


   Alamofilre: I have used the third party solution to communicate to server to fetch the data and parse it. I have used the Codeable protocol to parse the date directly from Model. 

   Please feel free to contact me if you have any suggestion or feedback to share. :) You can reach me on jaiswal.rakesh@gmail.com to disple your double.
    





