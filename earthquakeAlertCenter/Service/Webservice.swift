//
//  Webservice.swift
//  earthquakeAlertCenter
//
//  Created by Furkan Erzurumlu on 25.08.2021.
//

import Foundation


class WebService {
    
    func downloadCurrenies(url : URL, completion : @escaping (Earthquake?) -> Void){
        URLSession.shared.dataTask(with: url)
    }
}
