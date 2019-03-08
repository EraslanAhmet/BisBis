//
//  Citybikes.swift
//  BisBis
//
//  Created by Yakup Ad on 3.03.2019.
//  Copyright © 2019 Yakup Ad. All rights reserved.
//

import Alamofire
import Alamofire_SwiftyJSON

class Citybikes {
    let baseURL = "https://api.citybik.es/v2/networks"
    
    
    func GetNetworks(){
        var parsedResponse = [Network]()
        Alamofire.request(baseURL, method: .get, encoding: URLEncoding.default)
            .responseSwiftyJSON { dataResponse in
                let json = (dataResponse.value!)["networks"];
                
                json.map {data in
                    let jsonNetwork = data.1.dictionaryObject!
                    
                    var locationData = data.1["location"].dictionaryObject!
                    let location = Location(City: locationData["city"] as! String,
                                            Country: locationData["country"] as! String,
                                            Latitude: locationData["latitude"] as! Double,
                                            Longitude: locationData["longitude"] as! Double)
                    
                    
                    if data.1["company"].array != nil {
                        let companyArray = data.1["company"].arrayObject! as Array
                        parsedResponse.append(Network(Company: companyArray as! Array<String>,
                                                      Href: jsonNetwork["href"] as! String,
                                                      Id: jsonNetwork["id"] as! String,
                                                      Location: location,
                                                      Name: jsonNetwork["name"] as! String))
                    }else{
                        let companyArray = ["null"]
                        parsedResponse.append(Network(Company: companyArray as! Array<String>,
                                                      Href: jsonNetwork["href"] as! String,
                                                      Id: jsonNetwork["id"] as! String,
                                                      Location: location,
                                                      Name: jsonNetwork["name"] as! String))
                    }
                    
                    
                   
                    
                    
                }
                
                print(parsedResponse.map{(data) in
                    print(data.Company)
                    print(data.Href)
                    print(data.Id)
                    print(data.Location.City)
                    print(data.Name)
                    print("-------------------")
                })
                
                
        
        
    }
        
    }
}
