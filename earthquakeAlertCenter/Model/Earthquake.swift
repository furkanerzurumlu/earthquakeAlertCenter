//
//  Earthquake.swift
//  earthquakeAlertCenter
//
//  Created by Furkan Erzurumlu on 25.08.2021.
//

import Foundation

struct Earthquake : Decodable {
    let success : Bool
    let data : [Datum]
}

struct Datum : Decodable {
    let date : String
    let latitude, longitude, depth : Double
    let md, ml, mw, place : String
    let status : String
}

/*extension Earthquake: Displayable{
    
    var item1: (label: String, value : String){
        ("date", Earthquake.init(success: true, data: data))
    }
}
*/
