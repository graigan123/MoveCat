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
    
    dynamic var id = 0
    dynamic var name: String = ""
    dynamic var age: String = ""
    dynamic var userName: String = ""
    dynamic var password: String = ""
    dynamic var adult: Bool = false
    
    override public static func primaryKey() -> String? {
        return "id"
    }
    
    
}
