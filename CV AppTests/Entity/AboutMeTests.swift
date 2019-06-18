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
        let aboutMe = AboutMeResult(response: Response(aboutMe: AboutMe(about: About(titleSection: "About Title", text: "text", rowsInSection: 2), hobbies: About(titleSection: "Hobbies Title", text: "text", rowsInSection: 1), skills: Skills(titleSection: "Skills title", resume: "resume", rowsInSection: 3), sections: 3)))
        XCTAssertEqual(aboutMe.response.aboutMe.about.titleSection, "About Title")
        XCTAssertEqual(aboutMe.response.aboutMe.about.text, "text")
        XCTAssertEqual(aboutMe.response.aboutMe.about.rowsInSection, 2)
        XCTAssertEqual(aboutMe.response.aboutMe.hobbies.titleSection, "Hobbies Title")
        XCTAssertEqual(aboutMe.response.aboutMe.hobbies.text, "text")
        XCTAssertEqual(aboutMe.response.aboutMe.hobbies.rowsInSection, 1)
        XCTAssertEqual(aboutMe.response.aboutMe.skills.titleSection, "Skills title")
        XCTAssertEqual(aboutMe.response.aboutMe.skills.resume, "resume")
        XCTAssertEqual(aboutMe.response.aboutMe.skills.rowsInSection, 3)
        XCTAssertEqual(aboutMe.response.aboutMe.sections, 3)
    }
}
