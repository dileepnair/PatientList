//
//  PatientsTableViewListCell.swift
//  MHPatientsApp
//
//  Created by Dileep Sanker on 8/28/19.
//  Copyright © 2019 Dileep Sanker. All rights reserved.
//

import UIKit

typealias PatientsTableViewListViewPresentable = TextPresentable


class PatientsTableViewListCell: UITableViewCell, NibLoadable {
    
    // MARK: Private Variables
    @IBOutlet weak var nibContentView: PatientsCustomView!
    private var delegate: PatientsTableViewListViewPresentable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupFromNib()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupFromNib()
    }
    
    func configure(withDelegate delegate: PatientsTableViewListViewPresentable) {
        self.delegate = delegate
        self.contentView.setNeedsLayout()
        self.contentView.layoutIfNeeded()
      
//        backgroundColor = .clear
//        
//        label.text = delegate.text
//        label.textColor = delegate.textColor
//        label.font = delegate.font
    }
}

extension PatientsTableViewListCell{
 
    static var vcTitle:String?
    
    static func getCellIdentifier() -> String{
       return String(describing: self)
    }
}
