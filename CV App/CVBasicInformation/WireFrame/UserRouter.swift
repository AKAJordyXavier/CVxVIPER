//
//  UserRouter.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

class UserRouter: MainRouterProtocol{
   
    static func createModule(userRef: UserInfoViewController) {
        let presenter: MainPresenterProtocol & MainOutputIntercatorProtocol = MainPresenter()
        
        userRef.presenter = presenter
        userRef.presenter?.router = UserRouter()
        userRef.presenter?.view = userRef
        userRef.presenter?.interactor = MainInteractor()
        userRef.presenter?.interactor?.presenter = presenter
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name: "UserInfo", bundle: Bundle.main)
    }
    
    func pushAboutMe(){

    }
}
