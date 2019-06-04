//
//  MainProtocol.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 5/31/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

protocol MainViewControllerProtocol: class{
    //Presenter -> View
    func showUserInfo (with user: UserResult)
    func showNetworkingError()
    func createPulse()
    func animatePulse(index: Int)
}

protocol MainPresenterProtocol{
    //View -> Presenter
    var view: MainViewControllerProtocol? { get set }
    var interactor: MainInputIntercatorProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol MainInputIntercatorProtocol{
    //Presenter -> Interactor
    var presenter: MainOutputIntercatorProtocol? { get set }
    func fetchUserInfo ()
    
}

protocol MainOutputIntercatorProtocol{
    //Interactor -> Presenter
    func userFeteched(user: UserResult)
    func userFetchFailed()
}

protocol MainRouterProtocol{
    //Presenter -> Router
    static func createModule(userRef: UserInfoViewController)
}
