//
//  LoadingView.swift
//  SysZone
//
//  Created by tmp_user on 28/12/18.
//  Copyright © 2018 tmp_user. All rights reserved.
//

import UIKit
//import SpringIndicator
import Reusable

class LoadingView: BasicPlaceholderView, NibOwnerLoadable {
    
//    @IBOutlet weak var loading: SpringIndicator!
    @IBOutlet var contentView: UIView!
    
    override func configure() {
        self.loadNibContent()
        
//        self.contentView.backgroundColor = ColorName.backgroundTableView.color
//
//        loading.configure()
//        loading.start()
    }
}
