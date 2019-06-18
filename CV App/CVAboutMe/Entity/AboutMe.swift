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
    let about, hobbies: About
    let skills: Skills
    let sections: Int
    
    enum CodingKeys: String, CodingKey {
        case about, hobbies
        case skills = "Skills"
        case sections
    }
    
    init(about: About, hobbies: About, skills: Skills, sections: Int) {
        self.about = about
        self.hobbies = hobbies
        self.skills = skills
        self.sections = sections
    }
}

// MARK: - About
class About: Codable {
    let titleSection, text: String
    let rowsInSection: Int
    
    init(titleSection: String, text: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.text = text
        self.rowsInSection = rowsInSection
    }
}

// MARK: - Skills
class Skills: Codable {
    let titleSection, resume: String
    let rowsInSection: Int
    
    init(titleSection: String, resume: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.resume = resume
        self.rowsInSection = rowsInSection
    }
}
