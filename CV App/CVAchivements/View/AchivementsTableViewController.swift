//
//  AchivementsTableViewController.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/11/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class AchivementsTableViewController: UITableViewController, AchivementsViewControllerProtocol {
    
    //MARK: - Properties
    var achivementsList: AchivementsResult?
    var presenter: AchivementsPresenterProtocol?
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "Achivements"
        tableView.tableFooterView = UIView()
        presenter?.viewDidLoad()
        
    }
    
    func showAchivements(with achivements: AchivementsResult) {
        achivementsList = achivements
        DispatchQueue.main.async { [weak self ] in
            self?.tableView.reloadData()
        }
    }
    
    //Methods for display the generic alert
    func showNetworkingError() {
        DispatchQueue.main.sync { [weak self] in
            AlertView.instance.showAlert(title: "Error", message: "There was an error loading the information")
            self!.view.addSubview(AlertView.instance.parentView)
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return achivementsList?.achivementsResponse.achivements.sections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return achivementsList?.achivementsResponse.achivements.courses.rowsInSection ?? 0
            
        case 1:
            return achivementsList?.achivementsResponse.achivements.talks.rowsInSection ?? 0
            
        case 2:
            return achivementsList?.achivementsResponse.achivements.extras.rowsInSection ?? 0
            
        default:
            return 0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return achivementsList?.achivementsResponse.achivements.courses.titleSection
        }
        if section == 1{
            return achivementsList?.achivementsResponse.achivements.talks.titleSection
        }
        if section == 2{
            return achivementsList?.achivementsResponse.achivements.extras.titleSection
        }
        
        return "Nil"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AchivementsTableViewCell", for: indexPath) as! AchivementsTableViewCell
        if indexPath.section == 0{
            cell.textCellLabel.text = achivementsList?.achivementsResponse.achivements.courses.courses
        }
        if indexPath.section == 1{
            cell.textCellLabel.text = achivementsList?.achivementsResponse.achivements.talks.text
        }
        if indexPath.section == 2{
            cell.textCellLabel.text = achivementsList?.achivementsResponse.achivements.extras.resume
        }
        
        return cell
    }
}
