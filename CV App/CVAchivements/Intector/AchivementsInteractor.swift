//
//  AchivementsInteractor.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/11/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation


class AchivementsInteractor: AchivementsInputIntercatorProtocol{
    
    var presenter: AchivementsOutputIntercatorProtocol?
    var positionTable = [[String : AnyObject]]()
    func fetchAchivements() {
        Request.shared.request("2bf3e1ee16a4e751f5bbf8b7e86f303d/raw/c5ad45322897b58292db310316fe615a13478d38/Achivements", with: ["":""
        ]) { [weak self] fetchResult in
            
            switch fetchResult{
            case .success(let data):
                let achivementsFetch: AchivementsResult? = Request.shared.jsonDecode(data: data)
                guard let result = self?.presenter?.achivementsFeteched(achivements: achivementsFetch!) else{
                    self?.presenter?.userFetchFailed()
                    return
                }
            case .failure(_):
                self?.presenter?.userFetchFailed()
            }
        }
    }
}
