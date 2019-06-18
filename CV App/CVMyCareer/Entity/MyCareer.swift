//
//  MyCareer.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/10/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//
import Foundation

// MARK: - MyCareerResult
class MyCareerResult: Codable {
    let myCareerResponse: MyCareerResponse
    
    init(myCareerResponse: MyCareerResponse) {
        self.myCareerResponse = myCareerResponse
    }
}

// MARK: - MyCareerResponse
class MyCareerResponse: Codable {
    let myCareer: MyCareer
    
    enum CodingKeys: String, CodingKey {
        case myCareer = "MyCareer"
    }
    
    init(myCareer: MyCareer) {
        self.myCareer = myCareer
    }
}

// MARK: - MyCareer
class MyCareer: Codable {
    let studies: Studies
    let currentJob: CurrentJob
    let lastJob: LastJob
    let sections: Int
    
    enum CodingKeys: String, CodingKey {
        case studies = "Studies"
        case currentJob = "CurrentJob"
        case lastJob = "LastJob"
        case sections
    }
    
    init(studies: Studies, currentJob: CurrentJob, lastJob: LastJob, sections: Int) {
        self.studies = studies
        self.currentJob = currentJob
        self.lastJob = lastJob
        self.sections = sections
    }
}

// MARK: - CurrentJob
class CurrentJob: Codable {
    let titleSection, text: String
    let rowsInSection: Int
    
    init(titleSection: String, text: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.text = text
        self.rowsInSection = rowsInSection
    }
}

// MARK: - LastJob
class LastJob: Codable {
    let titleSection, resume: String
    let rowsInSection: Int
    
    init(titleSection: String, resume: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.resume = resume
        self.rowsInSection = rowsInSection
    }
}

// MARK: - Studies
class Studies: Codable {
    let titleSection, studie: String
    let rowsInSection: Int
    
    init(titleSection: String, studie: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.studie = studie
        self.rowsInSection = rowsInSection
    }
}
