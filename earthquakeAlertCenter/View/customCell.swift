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
    override func awakeFromNib() {
        super.awakeFromNib()
        topView.layer.cornerRadius = 10
        degreeView.layer.cornerRadius = degreeView.bounds.width / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func asd()
    {
        nameText.text = "dasdasdasd"
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
