//
//  MainProtocol.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 5/31/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

protocol AboutMeViewControllerProtocol: class{
    //Presenter -> View
    func showUserInfo (with user: UserResult)
    func showNetworkingError()
    func createPulse()
    func animatePulse(index: Int)
}

protocol AboutMePresenterProtocol{
    //View -> Presenter
    var view: AboutMeViewControllerProtocol? { get set }
    var interactor: AboutMeInputIntercatorProtocol? { get set }
    var router: AboutMeRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol AboutMeInputIntercatorProtocol{
    //Presenter -> Interactor
    var presenter: AboutMeOutputIntercatorProtocol? { get set }
    func fetchUserInfo ()
    
}

protocol AboutMeOutputIntercatorProtocol{
    //Interactor -> Presenter
    func userFeteched(user: UserResult)
    func userFetchFailed()
}

protocol AboutMeRouterProtocol{
    //Presenter -> Router
    static func createModule(userRef: UserInfoViewController)
}
