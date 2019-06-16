//
//  LoginModel.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 13/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class User: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name: String = ""
    @objc dynamic var age: String = ""
    @objc dynamic var userName: String = ""
    @objc dynamic var password: String = ""
    
    
    override public static func primaryKey() -> String? {
        return "userName"
    }
    
    
}
