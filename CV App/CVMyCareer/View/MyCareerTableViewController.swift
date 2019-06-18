//
//  MyCareerTableViewController.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/10/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class MyCareerTableViewController: UITableViewController, MyCareerViewControllerProtocol {
    
    //MARK: - Properties
    var myCareerMeList: MyCareerResult?
    var presenter: MyCareerPresenterProtocol?
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "My Career"
        tableView.tableFooterView = UIView()
        presenter?.viewDidLoad()
        
    }
    
    func showMyCareer(with myCareer: MyCareerResult) {
        myCareerMeList = myCareer
        DispatchQueue.main.async { [weak self ] in
            self?.tableView.reloadData()
        }
    }
    
    func showNetworkingError() {
        DispatchQueue.main.sync { [weak self] in
            AlertView.instance.showAlert(title: "Error", message: "There was an error loading the information")
            self!.view.addSubview(AlertView.instance.parentView)
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return myCareerMeList?.myCareerResponse.myCareer.sections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return myCareerMeList?.myCareerResponse.myCareer.studies.rowsInSection ?? 0
            
        case 1:
            return myCareerMeList?.myCareerResponse.myCareer.currentWork.rowsInSection ?? 0
            
        case 2:
            return myCareerMeList?.myCareerResponse.myCareer.lastJob.rowsInSection ?? 0
            
        default:
            return 0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return myCareerMeList?.myCareerResponse.myCareer.studies.titleSection
        }
        if section == 1{
            return myCareerMeList?.myCareerResponse.myCareer.currentWork.titleSection
        }
        
        if section == 2{
            return myCareerMeList?.myCareerResponse.myCareer.lastJob.titleSection
        }
        
        return "Nil"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCareerTableViewCell", for: indexPath) as! MyCareerTableViewCell
        if indexPath.section == 0{
            cell.textCellLabel.text = myCareerMeList?.myCareerResponse.myCareer.studies.achivements
        }
        if indexPath.section == 1{
            cell.textCellLabel.text = myCareerMeList?.myCareerResponse.myCareer.currentWork.text
        }
        if indexPath.section == 2{
            cell.textCellLabel.text = myCareerMeList?.myCareerResponse.myCareer.lastJob.resume
        }
        
        return cell
    }
}
