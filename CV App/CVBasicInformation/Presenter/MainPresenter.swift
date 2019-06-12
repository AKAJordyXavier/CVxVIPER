//
//  MainPresenter.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

class MainPresenter: MainPresenterProtocol {
    
    var view: MainViewControllerProtocol?
    var interactor: MainInputIntercatorProtocol?
    var router: MainRouterProtocol?
    
    func viewDidLoad() {
        self.updateView()
    }
    
    func updateView() {
        interactor?.fetchUserInfo()
    }
    
    func aboutMePressed() {
        router?.pushAboutMe()
    }
    
    func myCareerPressed() {
        router?.pushMyCareer()
    }
    
    func achivementsPressed() {
        router?.pushAchivements()
    }    
}

extension MainPresenter: MainOutputIntercatorProtocol{
    func userFeteched(user: UserResult) {
        view?.showUserInfo(with: user)
    }
    
    func userFetchFailed() {
        view?.showNetworkingError()
    }
}
