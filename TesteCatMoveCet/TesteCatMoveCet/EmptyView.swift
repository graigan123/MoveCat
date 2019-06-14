//
//  EmptyView.swift
//  SysZone
//
//  Created by tmp_user on 28/12/18.
//  Copyright © 2018 tmp_user. All rights reserved.
//


import UIKit
import Reusable

class EmptyView: BasicPlaceholderView, NibOwnerLoadable {
    
    @IBOutlet weak var emptyText: UILabel!
    @IBOutlet var contentView: UIView!
    
    required init(frame: CGRect, topOffset: CGFloat, emptyMessage: String? = nil) {
        super.init(frame: frame, topOffset: topOffset)
        
        if let emptyMessage = emptyMessage {
            
            self.emptyText.text = emptyMessage
        } else {
            
            self.emptyText.text = "No Content."
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func configure() {
        self.loadNibContent()
        
//        self.contentView.backgroundColor = ColorName.backgroundTableView.color
    }
}
