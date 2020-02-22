//
//  PatientViewModel.swift
//  MHPatientsApp
//
//  Created by Dileep Sanker on 8/28/19.
//  Copyright © 2019 Dileep Sanker. All rights reserved.
//

import UIKit


struct PatientViewModel {
     var patient: PatientModel
}

extension PatientViewModel: TextPresentable {
    
    var text: String { return "Minion Mode" }
    
    var textColor: UIColor { return .black }
    
    var font: UIFont { return .systemFont(ofSize: 17.0) }
    
}

extension PatientViewModel {
    
     static var title: String {
        return "Patients"
    }
    
    var fullName: String {
        return "\(patient.lastName ?? "Dileep") ,\(patient.firstName ?? "Sanker")"
    }
    
    var birthdateText: String {
        return PatientViewModel.dateFormatter.string(from: patient.dob!)
    }
    
    var locationText: String{
          return patient.location!
    }
    
    fileprivate static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }
    
}

extension PatientViewModel{
    
   static func dateFromString(_ datString:String) -> Date{
        
        let isoDate = datString
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        let dateFromString = dateFormatter.date(from:isoDate)!
        
        return dateFromString
    }
    
    static func getPatientsList(_ completionHandler: @escaping (_ patientArr:[PatientModel],_ success: Bool)->() ){
        let networkManager = NetworkManager()
        networkManager.getPatients(page: 0, completion: { patients, error in
            var patientModelArr = [PatientModel]()
            guard let patients = patients else{
                completionHandler([], false)
                return
            }
            for patient in patients{
                let pat =  patient as! [String:Any]
                
               let patArray =  PatientModel(id: pat["id"]! as! Int16,
                                            firstName: (pat["fname"]! as! String),
                                            lastName: pat["lname"]! as? String,
                                            dob: dateFromString(pat["dob"] as! String) ,
                                            location: (pat["location"]! as! String))
                
               
                patientModelArr.append(patArray)
                

              //  ["id": 22, "location": Unit 3, "lname": Manning, "dob": 04/15/1986, "fname": Leonard]
                
            }
            completionHandler(patientModelArr, true)
        })
        
    }

}
