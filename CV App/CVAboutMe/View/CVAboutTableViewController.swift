//
//  CVAboutTableViewController.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/4/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class CVAboutTableViewController: UITableViewController, AboutMeViewControllerProtocol {
    
    var aboutMeList = [AboutMe]()
    var presenter: AboutMePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showAboutMe(with aboutMe: [AboutMe]) {
        aboutMeList = aboutMe
        tableView.reloadData()
    }
    
    func showNetworkingError() {
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        return cell
    }

}
