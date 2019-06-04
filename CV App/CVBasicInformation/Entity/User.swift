//
//  User.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation


class UserResult: Codable{
    let response: UserResponse
}

class UserResponse: Codable{
    let userInfo: UserInfo
}

class UserInfo: Codable {
    let userName: String?
    let imageURL: String?
    let linkedInURL: String?
}
