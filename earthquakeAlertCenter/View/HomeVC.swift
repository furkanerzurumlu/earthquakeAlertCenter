//
//  ViewController.swift
//  earthquakeAlertCenter
//
//  Created by Furkan Erzurumlu on 23.08.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    lazy var mainData : [Datum] = webService.response!.data
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var leadingConst: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var developerView: UIView!
    
    
    var viewModel: HomeVM = HomeVM()
    var sideMenu = false
    var webService = AlamofireWebservice()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webService.reloadData = {
            self.tableView.reloadData()
        }
        
        webService.fetchEarthquake()
        tableView.register(customCell.nibName, forCellReuseIdentifier: customCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Son Depremler"
        self.tableView.backgroundColor = UIColor.red
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        mainView.layer.cornerRadius = 10
        developerView.layer.cornerRadius = 10
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.mainView.addGestureRecognizer(gesture)
        mainView.isUserInteractionEnabled = true
    }
    @objc func checkAction(sender : UITapGestureRecognizer){
        
    }
    
    @IBAction func sideMenu(_ sender: Any) {
       sidemenuAction()
}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webService.response?.data.count ?? 0
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
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        //let nextVC = DetailVC()
        self.navigationController?.pushViewController(vc, animated: false)
     
    }*/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = webService.response?.data[indexPath.row]
        let viewController = DetailVC.instantiate(storyboard: .detail, bundle: nil, identifier: nil)
        viewController.mainData = data
        
       // self.performSegue(withIdentifier: "detailSegue", sender: self)
    self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @IBAction func mainButton(_ sender: Any) {
        sidemenuAction()
    }
    
    @IBAction func developerButton(_ sender: Any) {
       
        //self.performSegue(withIdentifier: "developerSegue", sender: nil)
        developer()
    }
    
    func sidemenuAction(){
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
                self.navigationController?.navigationBar.barTintColor = UIColor.red
            }
        }
        sideMenu = !sideMenu
    }
    @objc func developer(){
        let developerVC = DeveloperVc.instantiate(storyboard: .main, bundle: nil, identifier: nil)
        
        self.navigationController?.pushViewController(developerVC, animated: true)
    }
}
    

    
