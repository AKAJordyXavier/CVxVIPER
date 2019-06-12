import Foundation

// MARK: - AboutMeResult
class AboutMeResult: Codable {
    let response: Response
    
    init(response: Response) {
        self.response = response
    }
}

// MARK: - Response
class Response: Codable {
    let aboutMe: AboutMe
    
    enum CodingKeys: String, CodingKey {
        case aboutMe = "AboutMe"
    }
    
    init(aboutMe: AboutMe) {
        self.aboutMe = aboutMe
    }
}

// MARK: - AboutMe
class AboutMe: Codable {
    let about: About
    let hobbies: Hobbies
    let review: Review
    let sections: Int
    
    init(about: About, hobbies: Hobbies, review: Review, sections: Int) {
        self.about = about
        self.hobbies = hobbies
        self.review = review
        self.sections = sections
    }
}

// MARK: - About
class About: Codable {
    let titleSection, achivements: String
    let rowsInSection: Int
    
    enum CodingKeys: String, CodingKey {
        case titleSection
        case achivements = "Achivements"
        case rowsInSection
    }
    
    init(titleSection: String, achivements: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.achivements = achivements
        self.rowsInSection = rowsInSection
    }
}

// MARK: - Hobbies
class Hobbies: Codable {
    let titleSection, text: String
    let rowsInSection: Int
    
    init(titleSection: String, text: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.text = text
        self.rowsInSection = rowsInSection
    }
}

// MARK: - Review
class Review: Codable {
    let titleSection, resume: String
    let rowsInSection: Int
    
    init(titleSection: String, resume: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.resume = resume
        self.rowsInSection = rowsInSection
    }
}
