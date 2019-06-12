//
//  AboutMeInteractor.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/7/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation

class AboutMeInteractor: AboutMeInputIntercatorProtocol{
    
    var presenter: AboutMeOutputIntercatorProtocol?
    var positionTable = [[String : AnyObject]]()
    func fetchAboutMe() {
        Request.shared.request("b290f1f79adcbee0d716410e5862fa12/raw/8572080723a5ceafc2f291df58acc61c225f7481/AboutMe", with: ["":""
        ]) { [weak self] fetchResult in
            
            switch fetchResult{
            case .success(let data):
                let aboutMeFetch: AboutMeResult? = Request.shared.jsonDecode(data: data)
                guard let result = self?.presenter?.aboutMeFeteched(aboutMe: aboutMeFetch!) else{
                    self?.presenter?.userFetchFailed()
                    return
                }
            case .failure(_):
                self?.presenter?.userFetchFailed()
            }
        }
    }
}
