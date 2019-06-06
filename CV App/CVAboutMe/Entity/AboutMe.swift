//
//  AboutMe.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/6/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation

class AboutMeResult: Codable{
    let response: AboutMeResponse
}

class AboutMeResponse: Codable{
    let userInfo: AboutMe
}

class AboutMe: Codable {
    let userName: String?
    let imageURL: String?
    let linkedInURL: String?
}
