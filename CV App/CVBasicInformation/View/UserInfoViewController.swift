//
//  ViewController.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 5/31/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit
import WebKit

class UserInfoViewController: UIViewController, MainViewControllerProtocol {
    
    var presenter: MainPresenterProtocol?
    var user: UserResult?
    // MARK: - Outlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cellphoneLabel: UILabel!
    @IBOutlet weak var profileUserImage: UIImageView!
    @IBOutlet weak var emptyStateView: UIView!
    @IBOutlet weak var myCareerButton: UIButton!
    @IBOutlet weak var aboutMeButton: UIButton!
    @IBOutlet weak var achivementsButton: UIButton!
    @IBOutlet weak var linkedInButton: UIButton!
    
    // MARK: - Properties
    var linkedInUrl: String?
    var pulseLayers = [CAShapeLayer]()
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        profileUserImage.layer.cornerRadius = profileUserImage.frame.size.width/2.0
        linkedInButton.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createPulse()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        profileUserImage.layer.removeAllAnimations()
    }
    
    //Method for paint all the user basic information from the requesr
    func showUserInfo(with user: UserResult) {
        let userInfo = user.response.userInfo
        let userName = userInfo.userName
        _ = userInfo.linkedInURL
        let imageURL = userInfo.imageURL
        let age = userInfo.age
        let email = userInfo.email
        let cellphone = userInfo.cellphone
        
        DispatchQueue.main.async  { [weak self] in
            self?.userNameLabel.text = userName
            self?.ageLabel.text = age
            self?.cellphoneLabel.text = cellphone
            self?.emailLabel.text = email
            self?.profileUserImage.load(from: "\(imageURL!)")
        }
    }
    
    func showNetworkingError() {
        DispatchQueue.main.sync { [weak self] in
            self!.emptyStateView.isHidden = false
            AlertView.instance.showAlert(title: "Error", message: "There was an error loading the information")
            self!.view.addSubview(AlertView.instance.parentView)
        }
    }
    //Method for animated the pulse
    func animatePulse(index: Int){
        pulseLayers[index].strokeColor = UIColor.white.cgColor
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        scaleAnimation.duration = 6.6
        scaleAnimation.fromValue = 0.0
        scaleAnimation.toValue = 1.4
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        scaleAnimation.repeatCount = .greatestFiniteMagnitude
        pulseLayers[index].add(scaleAnimation, forKey: "scale")
        
        let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacityAnimation.duration = 6.6
        opacityAnimation.fromValue = 1.4
        opacityAnimation.toValue = 0.0
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        opacityAnimation.repeatCount = .greatestFiniteMagnitude
        pulseLayers[index].add(scaleAnimation, forKey: "opacity")
    }
    //Method for create a pulse
    func createPulse() {
        for _ in 0...2{
            let circularPath = UIBezierPath(arcCenter: .zero, radius: UIScreen.main.bounds.size.width/2.0, startAngle: 0 , endAngle: 2 * .pi , clockwise: true)
            let pulseLayer = CAShapeLayer()
            pulseLayer.path = circularPath.cgPath
            pulseLayer.lineWidth = 2.0
            pulseLayer.fillColor = UIColor.clear.cgColor
            pulseLayer.lineCap = CAShapeLayerLineCap.round
            pulseLayer.position = CGPoint(x: profileUserImage.bounds.width, y: 0)
            profileUserImage.layer.addSublayer(pulseLayer)
            pulseLayers.append(pulseLayer)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.animatePulse(index: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                self.animatePulse(index: 1)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
                    self.animatePulse(index: 2)
                }
            }
        }
    }
    
    //MARK: - Buttons
    @IBAction func aboutMeButton(_ sender: Any) {
        presenter?.aboutMePressed()
    }
    
    @IBAction func myCareerButton(_ sender: Any) {
        presenter?.myCareerPressed()
    }
    
    @IBAction func achivementsButton(_ sender: Any) {
        presenter?.achivementsPressed()
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        reloadViewFromNib()
    }
    @IBAction func linkedInButton(_ sender: Any) {
    }
}

//MARK: - UIViewController Extension
extension UIViewController{
    func reloadViewFromNib(){
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view)
    }
}
