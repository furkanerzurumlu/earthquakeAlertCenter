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

    @IBOutlet weak var degreeView: UIView!
    
    @IBOutlet weak var mdLabel: UILabel!
    @IBOutlet weak var coordinateView: UIView!
    @IBOutlet weak var mdView: UIView!
    @IBOutlet weak var mlView: UIView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var mdcolorView: UIView!
    @IBOutlet weak var northLabel: UILabel!
    
    @IBOutlet weak var southLabel: UILabel!
    
    @IBOutlet weak var mlLabel: UILabel!
    
    @IBOutlet weak var mdDetailLabel: UILabel!
    
    // AUTO LAYOUT
    
    
    override func awakeFromNib() {
        
        coordinateView.layer.cornerRadius = 10
        mdView.layer.cornerRadius = 10
        mlView.layer.cornerRadius = 10
        
        //detailView.layer.cornerRadius = 20
        mdcolorView.layer.cornerRadius = mdcolorView.frame.width/2
        
    }
    
    func confDetail(detail : Datum) {
        if detail.mw == "-.-"{
            mdLabel.text = detail.ml
        }else{
            mdLabel.text = detail.mw
        }
        distanceLabel.text = "\(detail.depth) KM"//String(detail.depth)
        
        if Double(mdLabel.text!)! <= 1.5{
            self.mdcolorView.backgroundColor = UIColor.green
        }
        if Double(mdLabel.text!)! > 1.5{
            self.mdcolorView.backgroundColor = UIColor.yellow
        }
        if Double(mdLabel.text!)! > 2.5{
            self.mdcolorView.backgroundColor = UIColor.orange
        }
        if Double(mdLabel.text!)! > 3.5{
            self.mdcolorView.backgroundColor = UIColor.red
        }
        
        locationLabel.text = detail.place
        
        detailLabel.text = detail.date
        
        northLabel.text = String(detail.latitude) + " N"
        
        southLabel.text = String(detail.longitude) + " E"
        
        //mdDetailLabel.text = String(detail.md)
        
        mlLabel.text = String(detail.ml)
    }
}
