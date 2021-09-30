//
//  DetailVC.swift
//  earthquakeAlertCenter
//
//  Created by Furkan Erzurumlu on 13.09.2021.
//

import UIKit
import Alamofire


class DetailVC: UIViewController {

    @IBOutlet weak var detailView: detailView!
    
    var viewModel = AlamofireWebservice()
    private lazy var mainData : [Datum] = viewModel.response!.data
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
}
