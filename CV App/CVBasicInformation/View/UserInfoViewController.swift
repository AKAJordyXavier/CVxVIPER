//
//  ViewController.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 5/31/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController, MainViewControllerProtocol {
    
    var presenter: MainPresenterProtocol?
    
    // MARK: - Outlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cellphoneLabel: UILabel!
    @IBOutlet weak var profileUserImage: UIImageView!
    
    // MARK: Properties
    var linkedInUrl: String?
    var pulseLayers = [CAShapeLayer]()
    var aboutMe = [AboutMe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        profileUserImage.layer.cornerRadius = profileUserImage.frame.size.width/2.0
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
    
    @IBAction func aboutMeButton(_ sender: Any) {
        presenter?.aboutMePressed(aboutMe)
    }
    
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
    }
    
    func animatePulse(index: Int){
        
        pulseLayers[index].strokeColor = UIColor.white.cgColor
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        scaleAnimation.duration = 3.5
        scaleAnimation.fromValue = 0.0
        scaleAnimation.toValue = 1.1
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        scaleAnimation.repeatCount = .greatestFiniteMagnitude
        pulseLayers[index].add(scaleAnimation, forKey: "scale")
        
        let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacityAnimation.duration = 3.5
        opacityAnimation.fromValue = 1.1
        opacityAnimation.toValue = 0.0
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        opacityAnimation.repeatCount = .greatestFiniteMagnitude
        pulseLayers[index].add(scaleAnimation, forKey: "opacity")

    }
    
    func createPulse() {
        for _ in 0...2{
            let circularPath = UIBezierPath(arcCenter: .zero, radius: UIScreen.main.bounds.size.width/2.0, startAngle: 0 , endAngle: 6 * .pi , clockwise: true)
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    self.animatePulse(index: 2)
                }
            }
        }
    }
    
}

