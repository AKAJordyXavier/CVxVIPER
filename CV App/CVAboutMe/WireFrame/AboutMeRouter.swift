//
//  AboutMeRouter.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/6/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

class AboutMeRouter: AboutMeRouterProtocol{
    static func createModule(_ aboutMe: [AboutMe]) -> UIViewController{
        let view = UIStoryboard(name: "CVAboutMe", bundle: nil).instantiateViewController(withIdentifier: Constants.StoryboardNames.cvAboutMe) as! CVAboutTableViewController
        let presenter = AboutMePresenter()
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.aboutMe = aboutMe
        
        navigation.isNavigationBarHidden = true
        
        return view
    }
    
    
}
