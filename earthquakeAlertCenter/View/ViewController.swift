//
//  ViewController.swift
//  earthquakeAlertCenter
//
//  Created by Furkan Erzurumlu on 23.08.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    private lazy var mainData : [Datum] = viewModel.response!.data
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var leadingConst: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var sideMenu = false
    var viewModel = AlamofireWebservice()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.reloadData = {
            self.tableView.reloadData()
        }
        
        viewModel.fetchEarthquake()
        tableView.register(customCell.nibName, forCellReuseIdentifier: customCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Son Depremler"
        self.tableView.backgroundColor = UIColor.red
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.response?.data.count ?? 0
        //return viewModel.datum?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: customCell.identifier, for: indexPath) as! customCell
        cell.conf(detail: mainData[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
