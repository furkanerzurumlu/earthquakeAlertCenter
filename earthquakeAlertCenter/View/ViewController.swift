//
//  ViewController.swift
//  earthquakeAlertCenter
//
//  Created by Furkan Erzurumlu on 23.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sideMenuView: UIView!
    var sideMenu = false
    var earthqueakeViewModel : earthquakeVM!
    @IBOutlet weak var leadingConst: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Son Depremler"
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        
    }
    
    @IBAction func sideMenu(_ sender: Any) {
        
        
        if (sideMenu){
            leadingConst.constant = -240
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn) {
                self.view.layoutIfNeeded()
                self.navigationItem.title = "Son Depremler"
                self.navigationController?.navigationBar.barTintColor = UIColor.red
            }

        } else {
            leadingConst.constant = 0
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn) {
                self.view.layoutIfNeeded()
                self.navigationItem.title = "Menü"
                self.navigationController?.navigationBar.barTintColor = UIColor.cyan
                
        }
    }
        sideMenu = !sideMenu
}

}
