//
//  Person.swift
//  MHPatientsApp
//
//  Created by Dileep Sanker on 8/28/19.
//  Copyright © 2019 Dileep Sanker. All rights reserved.
//

import Foundation

struct Person {
    var firstName: String
    var lastName: String
    var birthdate: Date
    var location: String
}

extension Person {
    
    static func steveJobs() -> Person {
        var birthdateComponents = DateComponents()
        birthdateComponents.year = 1955
        birthdateComponents.month = 2
        birthdateComponents.day = 24
        let birthdate = Calendar.current.date(from: birthdateComponents)!
        
        return Person(firstName: "Steve", lastName: "Jobs", birthdate: birthdate,location: "USA")
    }
    
}
