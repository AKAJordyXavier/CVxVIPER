//
//  AboutMeTests.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/17/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//
import XCTest
@testable import CV_App

class AboutMeTests: XCTestCase{
    
    func testUsrInfoSetGet(){
        let aboutMe = AboutMeResult(response: Response(aboutMe: AboutMe(about: About(titleSection: "About Title", achivements: "Test achivements", rowsInSection: 2), hobbies: Hobbies(titleSection: "Hobbies Title", text: "Test text", rowsInSection: 2), review: Review(titleSection: "Review Title", resume: "Test Resume", rowsInSection: 2), sections: 3)))
        XCTAssertEqual(aboutMe.response.aboutMe.about.titleSection, "About Title")
        XCTAssertEqual(aboutMe.response.aboutMe.about.achivements, "Test achivements")
        XCTAssertEqual(aboutMe.response.aboutMe.about.rowsInSection, 2)
        XCTAssertEqual(aboutMe.response.aboutMe.hobbies.titleSection, "Hobbies Title")
        XCTAssertEqual(aboutMe.response.aboutMe.hobbies.text, "Test text")
        XCTAssertEqual(aboutMe.response.aboutMe.hobbies.rowsInSection, 2)
        XCTAssertEqual(aboutMe.response.aboutMe.review.titleSection, "Review Title")
        XCTAssertEqual(aboutMe.response.aboutMe.review.resume, "Test Resume")
        XCTAssertEqual(aboutMe.response.aboutMe.review.rowsInSection, 2)
        XCTAssertEqual(aboutMe.response.aboutMe.sections, 3)
    }
}
