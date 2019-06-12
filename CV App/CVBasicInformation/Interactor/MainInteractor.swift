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
        Request.shared.request("75db75d855f4805cbdc4fcf9ee8670db/raw/cc7a939cc8082191ea93f4f1aa866de6021ee850/UserInfo", with: ["":""
        ]) { [weak self] fetchResult in
            
            switch fetchResult{
            case .success(let data):
                let userFetch: UserResult? = Request.shared.jsonDecode(data: data)
                guard  let user = userFetch, let result = self?.presenter?.userFeteched(user: user) else{
                    self?.presenter?.userFetchFailed()
                    return
                }
            case .failure(_):
                self?.presenter?.userFetchFailed()
            }
        }
    }
}
