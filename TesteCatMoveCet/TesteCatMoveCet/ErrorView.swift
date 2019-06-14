//
//  ErrorView.swift
//  SysZone
//
//  Created by tmp_user on 28/12/18.
//  Copyright © 2018 tmp_user. All rights reserved.
//

import UIKit
import Reusable

class ErrorView: BasicPlaceholderView, NibOwnerLoadable {
    
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var buttonAction: UIButton!
    @IBOutlet var contentView: UIView!
    
    override func configure() {
        self.loadNibContent()
        self.buttonAction.isHidden = true
        self.text.text = "Something went wrong."
        self.contentView.backgroundColor = UIColor.white
    }
}
