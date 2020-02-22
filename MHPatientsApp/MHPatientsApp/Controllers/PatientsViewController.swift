//
//  PatientsViewController.swift
//  MHPatientsApp
//
//  Created by Dileep Sanker on 8/28/19.
//  Copyright © 2019 Dileep Sanker. All rights reserved.
//

import UIKit


class PatientsViewController: UIViewController{
    
    @IBOutlet weak var patientsTableView: UITableView!
    let tableViewDataSource = PatientsViewControllerDataSource()

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var patients: [PatientModel]! = [] {
        didSet {
            tableViewDataSource.items = self.patients
            DispatchQueue.main.async{
                self.patientsTableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = PatientViewModel.title
        self.configureTableView()
        self.getPatientsList()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(refreshPatientsList), name: UIApplication.didBecomeActiveNotification, object: nil)
        let _ = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(refreshPatientsList), userInfo: nil, repeats: true)
        
    }
    
    @objc func refreshPatientsList(){
        DispatchQueue.main.async{
            self.activityIndicator.startAnimating()
        }
        print("Application became active")
          getPatientsList()
    }
    
   
    
     func getPatientsList(){
        PatientViewModel.getPatientsList{ patients, success in
            
            let sortedPatients = patients.sorted{ ($0.lastName!, $0.firstName!) <
                ($1.lastName!, $1.firstName!)}
            
            self.patients = sortedPatients
            DispatchQueue.main.async{
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    
    private func configureTableView(){
        patientsTableView.dataSource = tableViewDataSource
        patientsTableView.delegate = self
        DispatchQueue.main.async{
            self.patientsTableView.setNeedsLayout()
            self.patientsTableView.layoutIfNeeded()
        }
    }
    
}

// MARK: - ViewController: UITableViewDelegate -

extension PatientsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        patientsTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
