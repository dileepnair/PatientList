//
//  PatientsCustomView.swift
//  MHPatientsApp
//
//  Created by Dileep Sanker on 8/28/19.
//  Copyright © 2019 Dileep Sanker. All rights reserved.
//

import UIKit


final class PatientsCustomView: UIView,NibLoadable{
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupFromNib()
    }
    
    var fName:String?{
        didSet{
           firstNameLabel.text = fName
            firstNameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        }
    }
    
    var fullName:String?{
        didSet{
            fullNameLabel.text = fullName
             fullNameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        }
    }
    
    var lastName:String?{
        didSet{
            lastNameLabel.text = lastName
            lastNameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        }
    }
    
    var dob: String?{
        didSet{
            dobLabel.text = dob
            dobLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        }
    }
   
    var location: String?{
        didSet{
            locationLabel.text = location
            locationLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        }
    }
   
}

fileprivate extension PatientsCustomView{
    
    func customSetUp(){
       
        lastNameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        dobLabel.font = UIFont.preferredFont(forTextStyle: .body)
        locationLabel.font = UIFont.preferredFont(forTextStyle: .body)
    }
}
