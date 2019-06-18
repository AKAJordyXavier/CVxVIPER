//
//  UserInfoViewTests.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/16/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import XCTest
@testable import CV_App

class UserInfoViewTest: XCTestCase{
    
    var view: UserInfoViewController?
    var mockMainView: MockMainView?
    
    override func setUp() {
        
        let storyboard = UIStoryboard(name: "UserInfo", bundle: nil)
        mockMainView = MockMainView()
        view = storyboard.instantiateViewController(withIdentifier: "UserInfoViewController") as? UserInfoViewController
        
        self.view?.loadView()
        self.view?.viewDidLoad()
        
        var userNameLabel: UILabel! = UILabel()
        var ageLabel: UILabel! = UILabel()
        var emailLabel: UILabel! = UILabel()
        var cellphoneLabel: UILabel! = UILabel()
        var profileUserImage: UIImageView!
        var emptyStateView: UIView!
        var myCareerButton: UIButton!
        var aboutMeButton: UIButton!
        var achivementsButton: UIButton!
        var linkedInButton: UIButton!
        
    }
    
    func testShowUserInfoShowCorrectData(){
        let failTest = NSLocalizedString("Theres was an error showing user info data", comment: "")
        let expectationText = NSLocalizedString("Request success", comment: "")
        let expectation = XCTestExpectation(description: expectationText)
 
        let data1 = UserResult(response: UserResponse(userInfo: UserInfo(userName: "Test", age: "22", cellphone: "0000000", email: "test@globant.com", imageURL: "test.com", linkedInURL: "test.com")))
        
        guard (view?.showUserInfo(with: data1)) != nil else {
            XCTFail(failTest)
            return
        }
      expectation.fulfill()
    }
    
    func testGenericAlertDisplaySuccess(){
       let alert = AlertView.instance.showAlert(title: "Error", message: "There was an error loading the information")
        
    }
}
