//
//  Webservice.swift
//  earthquakeAlertCenter
//
//  Created by Furkan Erzurumlu on 25.08.2021.
//

import UIKit
import Alamofire

class AlamofireWebservice {
    var response : Earthquake?
    var datum : [Datum]?
    var reloadData: (() -> ())?
    
    func fetchEarthquake() {
        AF.request("https://apps.furkansandal.com/st/intern/")
            .validate()
            .responseDecodable(of: Earthquake.self) { (result) in
                
                switch result.result {
                case .failure(let error):
                    print(error)
                case .success(let requestResponse):
                    self.response = requestResponse
                    self.datum = requestResponse.data
                    self.reloadData?()
                }
            }
    }
}


