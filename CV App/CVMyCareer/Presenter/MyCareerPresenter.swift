//
//  MyCareerPresenter.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/10/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class MyCareerPresenter: MyCareerPresenterProtocol{
    weak var view: MyCareerViewControllerProtocol?
    var interactor: MyCareerInputIntercatorProtocol?
    var router: MyCareerRouterProtocol?
    
    var myCareer: MyCareerResult?
    
    func viewDidLoad() {
        self.updateView()
    }
    
    func updateView() {
        interactor?.fetchMyCareer()
    }
}

extension MyCareerPresenter: MyCareerOutputIntercatorProtocol{
    func myCareerFeteched(myCareer: MyCareerResult) {
        view?.showMyCareer(with: myCareer)
    }
    
    func userFetchFailed() {
        view?.showNetworkingError()
    }
}
