//
//  AlertView.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/12/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class AlertView: UIView {
    
    static let instance = AlertView()
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertContent: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        alertContent.layer.cornerRadius = 6
        okButton.layer.cornerRadius = 6
        headerView.layer.cornerRadius = 6
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func showAlert(title: String, message: String){
        titleLabel.text = title
        descriptionLabel.text = message
        
    }
    
    @IBAction func okAction(_ sender: Any) {
        parentView.removeFromSuperview()
    }
}
