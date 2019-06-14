//
//  BasicPlaceholderView.swift
//  SysZone
//
//  Created by tmp_user on 28/12/18.
//  Copyright © 2018 tmp_user. All rights reserved.
//

import Foundation

import UIKit

class BasicPlaceholderView: UIView, StatefulPlaceholderView {
    
    var topOffset: CGFloat = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    init(frame: CGRect, topOffset: CGFloat) {
        super.init(frame: frame)
        
        self.topOffset = topOffset
        self.configure()
    }
    
    func configure() { }
    
    func placeholderViewInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: topOffset, left: 0, bottom: 0, right: 0)
    }
}
