//
//  TextPresentable.swift
//  MHPatientsApp
//
//  Created by Dileep Sanker on 8/28/19.
//  Copyright © 2019 Dileep Sanker. All rights reserved.
//

import UIKit

protocol TextPresentable {
    var text: String { get }
    var textColor: UIColor { get }
    var font: UIFont { get }
}

extension TextPresentable {
    
    var textColor: UIColor {
        return .black
    }
    
    var font: UIFont {
        return .systemFont(ofSize: 17)
    }
    
}
