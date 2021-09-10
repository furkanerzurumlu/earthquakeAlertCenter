//
//  customCell.swift
//  earthquakeAlertCenter
//
//  Created by Furkan Erzurumlu on 25.08.2021.
//

import UIKit

class customCell: UITableViewCell {

    @IBOutlet weak var nameText: UILabel!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var degreeView: UIView!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var mdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        topView.layer.cornerRadius = 10
        degreeView.layer.cornerRadius = degreeView.bounds.width / 2
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func conf (detail : Datum){
        if detail.mw == "-.-"{
            mdLabel.text = detail.ml
        }else{
            mdLabel.text = detail.mw
        }
        locationLabel.text = detail.place
        detailLabel.text = detail.date
        distanceLabel.text = String(detail.depth)
        
        if Double(mdLabel.text!)! <= 1.5{
            self.degreeView.backgroundColor = UIColor.green
        }
        if Double(mdLabel.text!)! > 1.5{
            self.degreeView.backgroundColor = UIColor.yellow
        }
        if Double(mdLabel.text!)! > 2.5{
            self.degreeView.backgroundColor = UIColor.orange
        }
        if Double(mdLabel.text!)! > 3.5{
            self.degreeView.backgroundColor = UIColor.red
        }
    }

}

extension customCell {
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
