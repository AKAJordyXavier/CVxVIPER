//
//  CVAboutTableViewController.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/4/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class CVAboutTableViewController: UITableViewController, AboutMeViewControllerProtocol {
    //MARK: - Properties
    var aboutMeList: AboutMeResult?
    var presenter: AboutMePresenterProtocol?
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "AboutMe"
        tableView.tableFooterView = UIView()
        presenter?.viewDidLoad()
    }
    
    func showAboutMe(with aboutMe: AboutMeResult) {
        aboutMeList = aboutMe
        DispatchQueue.main.async { [weak self ] in
            self?.tableView.reloadData()
        }
    }
    //Method for display the generic alert
    func showNetworkingError() {
        DispatchQueue.main.sync { [weak self] in
            AlertView.instance.showAlert(title: "Error", message: "There was an error loading the information")
            self!.view.addSubview(AlertView.instance.parentView)
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return aboutMeList?.response.aboutMe.sections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return aboutMeList?.response.aboutMe.about.rowsInSection ?? 0
            
        case 1:
            return aboutMeList?.response.aboutMe.hobbies.rowsInSection ?? 0
            
        case 2:
            return aboutMeList?.response.aboutMe.review.rowsInSection ?? 0
            
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return aboutMeList?.response.aboutMe.about.titleSection
        }
        if section == 1{
            return aboutMeList?.response.aboutMe.hobbies.titleSection
        }
        if section == 2{
            return aboutMeList?.response.aboutMe.review.titleSection
        }
        return "Nil"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutMeTableViewCell", for: indexPath) as! AboutMeTableViewCell
        if indexPath.section == 0{
            cell.textCellLabel.text = aboutMeList?.response.aboutMe.about.achivements
        }
        if indexPath.section == 1{
            cell.textCellLabel.text = aboutMeList?.response.aboutMe.hobbies.text
        }
        if indexPath.section == 2{
            cell.textCellLabel.text = aboutMeList?.response.aboutMe.review.resume
        }
        return cell 
        
    }
}
