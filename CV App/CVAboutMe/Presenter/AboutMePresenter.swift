//
//  AboutMePresenter.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/6/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class AboutMePresenter: AboutMePresenterProtocol{
    
    weak var view: AboutMeViewControllerProtocol?
    var interactor: AboutMeInputIntercatorProtocol?
    var router: AboutMeRouterProtocol?
    var aboutMe: AboutMeResult?
    
    func viewDidLoad() {
        self.updateView()
    }
    
    func updateView() {
        interactor?.fetchAboutMe()
    }
    
}

extension AboutMePresenter: AboutMeOutputIntercatorProtocol{
    func aboutMeFeteched(aboutMe: AboutMeResult) {
        view?.showAboutMe(with: aboutMe)
    }
    
    func userFetchFailed() {
        view?.showNetworkingError()
    }
}
