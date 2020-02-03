# Project

this app makes an HTTP GET request to the public REST API at https://randomuser.me/. The service can return up to 5000 random generated user information.

I use this app to recall the core data and Alamofire knowledge. Because I have not using core data for a while.

## Todo
1: using the Codable Protocal to parse the JSON response from the web service

## Software
* IDE: Xcode 10.3 and Xcode 11.1
* Cocoapods

## ThirdParties
* Alamofire 4.9.0
* AlamofireImage 3.5.2
* PKHUD 5.0

## Resouces
* Font awesome

## Unit Test
* before call testAdds(), please delete app first to remove cache data.

## UI Test
* testGoToNextPage() need a specific user data
