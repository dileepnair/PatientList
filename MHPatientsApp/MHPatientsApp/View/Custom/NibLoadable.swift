//
//  NibLoadable.swift
//  MHPatientsApp
//
//  Created by Dileep Sanker on 8/28/19.
//  Copyright © 2019 Dileep Sanker. All rights reserved.
//

import UIKit

private var nibModalView : UIView!

//public
/**
 Enables a view to be loaded from a nib file.
 The name of the nib file defaults to the same name as the calling class.
 
 - note: The nib file name can be overridden using the `nibName()` function.
 
 */
protocol NibLoadable {
    static func nibName() -> String
    var modalView: UIView { get }
}

//public
extension NibLoadable where Self: UIView {
    
    //public
    static func nibName() -> String {
        return String(describing: Self.self)    // Defaults to the name of the class implementing this protocol.
    }

    //public
    var modalView: UIView {
        return nibModalView
    }
    
    //public
    static var nib: UINib {
        let bundle = Bundle(for: Self.self)
        return UINib(nibName: self.nibName(), bundle: bundle)
    }
    
    func getType() -> String {
        return  "NibLoadableView"
    }
    
    func setupFromNib() {
        if self.subviews.count > 0  {
            return
        }
        
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Error loading \(self) from nib")
        }
        
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.leadingAnchor.constraint(  equalTo: self.safeAreaLayoutGuide.leadingAnchor,    constant: 0).isActive = true
        view.topAnchor.constraint(      equalTo: self.safeAreaLayoutGuide.topAnchor,        constant: 0).isActive = true
        view.trailingAnchor.constraint( equalTo: self.safeAreaLayoutGuide.trailingAnchor,   constant: 0).isActive = true
        view.bottomAnchor.constraint(   equalTo: self.safeAreaLayoutGuide.bottomAnchor,     constant: 0).isActive = true
    }
    
    /**
     Display the view modally on the main window.
     */
    func modalFromNib() {
        if self.subviews.count > 0  {
            return
        }
        
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Error loading \(self) from nib")
        }
        
        nibModalView = view
        
        nibModalView.frame = UIScreen.main.bounds       // RJC Any way to use screen constraints instead ???
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow?.addSubview(nibModalView)
        keyWindow?.bringSubviewToFront(nibModalView)
    }
    
    func setHighlighted(_ highlighted: Bool, animated: Bool) {
        
        if highlighted == true {
            self.backgroundColor = .red
        } else {
            self.backgroundColor = .green
        }
    }
}
