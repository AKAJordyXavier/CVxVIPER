//
//  Achivements.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/11/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import Foundation

// MARK: - Welcome
class AchivementsResult: Codable {
    let achivementsResponse: AchivementsResponse
    
    init(achivementsResponse: AchivementsResponse) {
        self.achivementsResponse = achivementsResponse
    }
}

// MARK: - AchivementsResponse
class AchivementsResponse: Codable {
    let achivements: Achivements
    
    enum CodingKeys: String, CodingKey {
        case achivements = "Achivements"
    }
    
    init(achivements: Achivements) {
        self.achivements = achivements
    }
}

// MARK: - Achivements
class Achivements: Codable {
    let courses: Courses
    let talks: Talks
    let extras: Extras
    let sections: Int
    
    enum CodingKeys: String, CodingKey {
        case courses = "Courses"
        case talks = "Talks"
        case extras = "Extras"
        case sections
    }
    
    init(courses: Courses, talks: Talks, extras: Extras, sections: Int) {
        self.courses = courses
        self.talks = talks
        self.extras = extras
        self.sections = sections
    }
}

// MARK: - Courses
class Courses: Codable {
    let titleSection, ciscoCCNA: String
    let rowsInSection: Int
    
    enum CodingKeys: String, CodingKey {
        case titleSection
        case ciscoCCNA = "CiscoCCNA"
        case rowsInSection
    }
    
    init(titleSection: String, ciscoCCNA: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.ciscoCCNA = ciscoCCNA
        self.rowsInSection = rowsInSection
    }
}

// MARK: - Extras
class Extras: Codable {
    let titleSection, resume: String
    let rowsInSection: Int
    
    init(titleSection: String, resume: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.resume = resume
        self.rowsInSection = rowsInSection
    }
}

// MARK: - Talks
class Talks: Codable {
    let titleSection, talk1, talk2: String
    let rowsInSection: Int
    
    init(titleSection: String, talk1: String, talk2: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.talk1 = talk1
        self.talk2 = talk2
        self.rowsInSection = rowsInSection
    }
}
