//
//  detailView.swift
//  earthquakeAlertCenter
//
//  Created by Furkan Erzurumlu on 13.09.2021.
//

import UIKit
import Alamofire

class detailView : BaseView {
    
    var viewModel = AlamofireWebservice()
    private lazy var detailData : [Datum] = viewModel.response!.data

    @IBOutlet weak var coordinateView: UIView!
    @IBOutlet weak var mdView: UIView!
    @IBOutlet weak var mlView: UIView!
    
    @IBOutlet var detailView: UIView!
    
    @IBOutlet weak var mdLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        coordinateView.layer.cornerRadius = 10
        mdView.layer.cornerRadius = 10
        mlView.layer.cornerRadius = 10
        //detailView.layer.cornerRadius = 20
        
    }
    
    func confDetail(detail : Datum) {
        mdLabel.text = detail.md
        distanceLabel.text = String(detail.depth)
        
    }
}
