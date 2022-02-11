//
//  ViewController.swift
//  earthquakeAlertCenter
//
//  Created by Furkan Erzurumlu on 23.08.2021.
//

import UIKit
import Alamofire



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    lazy var mainData : [Datum] = webService.response!.data
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var leadingConst: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var menuTableView: UITableView!

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var viewModel: HomeVM = HomeVM()
    var sideMenu = false
    var webService = AlamofireWebservice()
    
    enum menuOptions : String , CaseIterable{
            case home = "Son Depremler"
            case profile = "Uygulama Geliştirici"
            
            var imageName : String {
                switch self {
                
                case .home:
                    return "home"
                case .profile:
                    return "profile"
                }
            }
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webService.reloadData = {
            self.tableView.reloadData()
        }
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.separatorStyle = .none
        self.menuTableView.backgroundColor = UIColor.red
        
        /////searchBar.searchTextField.backgroundColor = .white
        

        
        webService.fetchEarthquake()
        tableView.register(customCell.nibName, forCellReuseIdentifier: customCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Son Depremler"
        self.tableView.backgroundColor = UIColor.red
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        
        
 
    }
   
    
    @IBAction func sideMenu(_ sender: Any) {
       sidemenuAction()
}
 
    //////
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
        viewModel.sendData = data
        self.performSegue(withIdentifier: "detailSegue", sender: self)
        //self.navigationController?.pushViewController(DetailVC, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailVC
        detailVC.mainData = viewModel.sendData
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var searchBarData : [Earthquake] = []
        
        if searchText == ""{
            
        }
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

    
}
    

    
