//
//  Constants.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

class Constants{
    //Base URL for the API request
    public static let url = Bundle.main.object(forInfoDictionaryKey: "URLRequest") as! String
    
    //Storyboars names
    struct StoryboardNames {
        static let cvInformation = "UserInfoViewController"
        static let cvAboutMe = "CVAboutTableViewController"
        static let cvMyCareer = "MyCareerTableViewController"
        static let cvMyAchivements = "AchivementsTableViewController"
    }
    //Endpoints names 
    struct Endpoints {
        static let userInfo = "75db75d855f4805cbdc4fcf9ee8670db/raw/cc7a939cc8082191ea93f4f1aa866de6021ee850/UserInfo"
        static let aboutMe = "b290f1f79adcbee0d716410e5862fa12/raw/8572080723a5ceafc2f291df58acc61c225f7481/AboutMe"
        static let myCareer = "4243a721b9319fef96deb00e204678a4/raw/0810d4c8042bcb66676b7a5324929393f6104de8/MyCareer"
        static let achivements = "2bf3e1ee16a4e751f5bbf8b7e86f303d/raw/c5ad45322897b58292db310316fe615a13478d38/Achivements"
    }
}
