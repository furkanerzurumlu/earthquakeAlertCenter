//
//  DeveloperVc.swift
//  earthquakeAlertCenter
//
//  Created by Furkan Erzurumlu on 6.11.2021.
//

import UIKit

class DeveloperVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
    }
    

    
    @IBAction func github(_ sender: Any) {
        if let url = URL(string: "https://github.com/furkanerzurumlu") {
                    UIApplication.shared.open(url)
                }
    }
    
}
