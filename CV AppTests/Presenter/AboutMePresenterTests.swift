//
//  AboutMePresenterTests.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/17/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//
import XCTest
@testable import CV_App

class AboutMePresenterTests: XCTestCase{
    var presenter: AboutMePresenter?
    let mockInteractor = MockAboutMeInputInteractor()
    let mockRouter = MockAboutMeRouter()
    var mockView = MockAboutMeView()
   let aboutMe = AboutMeResult(response: Response(aboutMe: AboutMe(about: About(titleSection: "About Title", achivements: "Test achivements", rowsInSection: 2), hobbies: Hobbies(titleSection: "Hobbies Title", text: "Test text", rowsInSection: 2), review: Review(titleSection: "Review Title", resume: "Test Resume", rowsInSection: 2), sections: 3)))
    
    override func setUp() {
        super.setUp()
        presenter = AboutMePresenter()
        presenter?.interactor = mockInteractor
        presenter?.router = mockRouter
        mockView = MockAboutMeView()
        presenter?.view = mockView
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShowAboutMeSuccess(){
        presenter?.aboutMeFeteched(aboutMe: aboutMe)
        XCTAssert(mockView.showAboutMeCalled == 1, "Error test")
    }
    
    func testShowUserInfoFailed(){
        presenter?.aboutMeFetchFailed()
        XCTAssert(mockView.showAboutMeFailedCalled == 1, "Error test")
    }
    
    func testUpdateViewSuccess(){
        presenter?.updateView()
        XCTAssert(mockInteractor.fetchAboutMeCalled == 1, "Error test")
    }
    
}
