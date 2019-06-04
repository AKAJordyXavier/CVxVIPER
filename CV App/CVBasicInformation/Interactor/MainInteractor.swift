//
//  MainInteractor.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation

class MainInteractor: MainInputIntercatorProtocol{
    
    var presenter: MainOutputIntercatorProtocol?
    
    func fetchUserInfo() {
        Request.shared.request("", with: ["":""
        ]) { [weak self] fetchResult in
            
            switch fetchResult{
            case .success(let data):
                 let userFetch: UserResult? = Request.shared.jsonDecode(data: data)
                 guard let result = self?.presenter?.userFeteched(user: userFetch!) else{
                    self?.presenter?.userFetchFailed()
                    return
                }
            case .failure(_):
                self?.presenter?.userFetchFailed()
            }
        }
    }
}
