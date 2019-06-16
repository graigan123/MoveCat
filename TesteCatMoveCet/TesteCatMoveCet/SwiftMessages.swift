//
//  SwiftMessages.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 15/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//


import Foundation
import SwiftMessages
import HandyJSON
import SwiftyJSON
import ObjectMapper
import RealmSwift

protocol MessageAlertDelegate {
    func send()
}

class MessagesErrors: Object, HandyJSON {

    var error: String = ""

    func setJSON(json: String) -> String {

        if let erros = JSONDeserializer<MessagesErrors>.deserializeFrom(json: json) {

            return erros.error
            //            for erro in erros.error {
            //                self.error.append("\(erro)\n")
            //            }
        }

        //        var string = ""
        //
        //        for err in self.error {
        //            string = string + err
        //        }

        return "Nao tratou o error"
    }
}


class MessageAlert {
    
    var config = SwiftMessages.Config()
    let title: String?
    let body: String?
    let view = MessageView.viewFromNib(layout: .messageView)
    
    init(title: String?, body: String?, target: UIViewController) {
        
        config.presentationContext = .viewController(target)
        self.title = title
        self.body = body
        self.setupLabels()
    }
    
    convenience init(body: String, target: UIViewController, view: UIView? = nil) {
        self.init(title: nil, body: body, target:  target)
    }
    
    
    
    private func setupLabels() {
        
        self.view.button?.isHidden = true
        self.view.iconLabel?.isHidden = true
        self.view.iconImageView?.isHidden = true
        self.view.titleLabel?.textColor = UIColor.white
        self.view.bodyLabel?.textColor = UIColor.white
        self.view.titleLabel?.numberOfLines = 1
        self.view.bodyLabel?.numberOfLines = 0
        
        if let body = body {
            self.view.bodyLabel?.text = body
        } else {
            self.view.bodyLabel?.isHidden = true
        }
        
        if let title = title {
            self.view.titleLabel?.text = title
        } else {
            self.view.titleLabel?.isHidden = true
        }
    }
    
    private func showMessage(color: UIColor) {
        view.backgroundColor = color
        config.presentationStyle = .top
        SwiftMessages.show(config: config, view: view)
    }
    
    func showSuccess() {
        self.showMessage(color: UIColor.green)
    }
    
    func showAlert() {
        self.showMessage(color: UIColor.yellow)
    }
    
    func showError() {
        self.showMessage(color: UIColor.red)
    }
    
    func showInfo(_ tapHandler: (() -> ())? = nil) {
        
        view.tapHandler = { _ in
            SwiftMessages.hide()
            if let tapHandler = tapHandler {
                tapHandler()
            }
        }
        self.showMessage(color: UIColor.blue)
    }
}

