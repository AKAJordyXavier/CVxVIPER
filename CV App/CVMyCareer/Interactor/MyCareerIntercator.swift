//
//  MyCareerIntercator.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/10/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//
import Foundation

class MyCareerInteractor: MyCareerInputIntercatorProtocol{
   
    var presenter: MyCareerOutputIntercatorProtocol?
    var positionTable = [[String : AnyObject]]()
    func fetchMyCareer() {
        Request.shared.request("4243a721b9319fef96deb00e204678a4/raw/0810d4c8042bcb66676b7a5324929393f6104de8/MyCareer", with: ["":""
        ]) { [weak self] fetchResult in
            
            switch fetchResult{
            case .success(let data):
                let myCareerFetch: MyCareerResult? = Request.shared.jsonDecode(data: data)
                guard let result = self?.presenter?.myCareerFeteched(myCareer: myCareerFetch!) else{
                    self?.presenter?.userFetchFailed()
                    return
                }
            case .failure(_):
                self?.presenter?.userFetchFailed()
            }
        }
    }
}
