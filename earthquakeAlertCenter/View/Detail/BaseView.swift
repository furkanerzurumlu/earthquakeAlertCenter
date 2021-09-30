//
//  BaseView.swift
//  earthquakeAlertCenter
//
//  Created by Furkan Erzurumlu on 28.09.2021.
//

import UIKit

class BaseView: UIView, NibLoadProtocol {

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }

    // MARK: - NSCoding
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
}

protocol NibLoadProtocol: NSObjectProtocol {

    var nibContainerView: UIView { get }

    func loadNib() -> UIView

    func nibName() -> String

}

extension NibLoadProtocol {

    func loadNib() -> UIView {

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName(), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil)[0] as? UIView ?? UIView()
    }

    fileprivate func setupNib() {
        let view = self.loadNib()
        view.backgroundColor = UIColor.clear
        self.nibContainerView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view": view]
        self.nibContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: bindings))
        self.nibContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: bindings))
    }
}

extension UIView {

    var nibContainerView: UIView {
        return self
    }

    func nibName() -> String {
        return type(of: self).description().components(separatedBy: ".").last!
    }
}

