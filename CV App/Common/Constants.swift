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
    
    public static let url = Bundle.main.object(forInfoDictionaryKey: "URLRequest") as! String
    
    struct StoryboardNames {
        static let cvInformation = "UserInfoViewController"
        static let cvAboutMe = "CVAboutTableViewController"
        static let cvMyCareer = "MyCareerTableViewController"
        static let cvMyAchivements = "AchivementsTableViewController"
    }
}
