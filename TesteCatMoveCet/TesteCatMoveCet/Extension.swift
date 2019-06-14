//
//  Extension.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 14/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import Foundation
import UIKit


extension UITextField {
    
    func setTextField(placeholder: String) {
        
        self.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.textAlignment = .left
        self.backgroundColor = .clear
        self.addLineToView(view: self, position:.LINE_POSITION_BOTTOM, color: UIColor.white, width: 1.5)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        self.borderStyle = .none
        self.textColor = .white
        self.autocorrectionType = .no
    }
    
    func addLineToView(view : UIView, position : LINE_POSITION, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        view.addSubview(lineView)
        
        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        switch position {
        case .LINE_POSITION_TOP:
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .LINE_POSITION_BOTTOM:
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        }
    }
}

extension UIButton {
    
    func setButtonText(text: String) {
        self.setTitle(text, for: .normal)
        self.layer.cornerRadius = 5
        self.backgroundColor = .red
        self.tintColor = .blue
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    }
}

extension UIImageView {
    
    func setCicle(height: CGFloat) {
   
//        self.layer.cornerRadius = self.frame.width / 2
//        self.layer.borderWidth = 1
//        self.layer.masksToBounds = false
//        self.layer.borderColor = UIColor.white.cgColor
//        self.clipsToBounds = true
        
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = height/2
        self.clipsToBounds = true
    }
}
