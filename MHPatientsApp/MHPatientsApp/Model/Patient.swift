//
//  Patient.swift
//  MHPatientsApp
//
//  Created by Dileep Sanker on 8/28/19.
//  Copyright © 2019 Dileep Sanker. All rights reserved.
//

import Foundation

struct PatientApiResponse {
    let patients: [PatientModel]?
}

extension PatientApiResponse: Decodable {
    
    private enum PatientApiResponseCodingKeys: String, CodingKey {
        case patients
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PatientApiResponseCodingKeys.self)
        patients = try container.decode([PatientModel].self, forKey: .patients)
    }
}

struct PatientModel {
    let id: Int16
    let firstName: String?
    let lastName: String?
    let dob: Date?
    let location: String?
}

extension PatientModel: Decodable {
    
    enum PatientCodingKeys: String, CodingKey {
        case id
        case firstName = "fname"
        case lastName = "lname"
        case dob
        case location
    }
    
    
      init(from decoder: Decoder) throws {
        
        let patientContainer = try decoder.container(keyedBy: PatientCodingKeys.self)
        id = Int16(try patientContainer.decode(Int.self, forKey: .id))
        firstName = try patientContainer.decode(String.self, forKey: .firstName)
        lastName = try patientContainer.decode(String.self, forKey: .lastName)
        dob = try patientContainer.decode(Date.self, forKey: .dob)
        location = try patientContainer.decode(String.self, forKey: .location)
    
    }
}

extension PatientModel {
    
    static func steveJobs() -> PatientModel {
        var birthdateComponents = DateComponents()
        birthdateComponents.year = 1955
        birthdateComponents.month = 2
        birthdateComponents.day = 24
        let birthdate = Calendar.current.date(from: birthdateComponents)!
        
        return PatientModel(id: 12, firstName: "Steve", lastName: "Jobs", dob: birthdate, location: "USA")
    
    }
    
}
