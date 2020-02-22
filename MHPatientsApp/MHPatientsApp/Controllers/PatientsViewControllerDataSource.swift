//
//  PatientsViewControllerDataSource.swift
//  MHPatientsApp
//
//  Created by Dileep Sanker on 8/28/19.
//  Copyright © 2019 Dileep Sanker. All rights reserved.
//

import UIKit


class PatientsViewControllerDataSource: NSObject{
    public var items = [PatientModel]()
}

extension PatientsViewControllerDataSource: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = PatientsTableViewListCell.getCellIdentifier()
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! PatientsTableViewListCell
        let patientData = PatientViewModel(patient: items[indexPath.row])
        let patientView = cell.nibContentView
        patientView?.fullName = patientData.fullName
        patientView?.dob = patientData.birthdateText
        patientView?.location = patientData.locationText
    
        cell.configure(withDelegate: patientData)
            return cell
        
    }
}
