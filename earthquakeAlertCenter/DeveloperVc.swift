//
//  DeveloperVc.swift
//  earthquakeAlertCenter
//
//  Created by Furkan Erzurumlu on 6.11.2021.
//

import UIKit

class DeveloperVc: UIViewController {

    @IBOutlet weak var developerImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        developerImage.clipsToBounds = true
        developerImage.layer.cornerRadius = 30
    }
    
    
    
    @IBAction func github(_ sender: Any) {
        if let url = URL(string: "https://github.com/furkanerzurumlu") {
                    UIApplication.shared.open(url)
                }
    }
    
}
