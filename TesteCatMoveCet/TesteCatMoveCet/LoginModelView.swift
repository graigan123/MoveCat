//
//  LoginModelView.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 13/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

struct UserView {
    
    var name = ""
    var age = ""
    var password = ""
    var userName = ""
}

class UserModelView: ModelView {
    
    static func getUserAsView(_ user: User) -> UserView{
        
        var userView      = UserView()
        
        userView.name     = user.name
        userView.userName = user.userName
        userView.password = user.password
        
        return userView
    }
    
    static func getUser() -> User? {
        
        var usuarioModel = User()
        
        let result = uiRealm.objects(User.self)
        
        if let usuario = result.first {
            
            usuarioModel = usuario
            
            return usuarioModel
        }
        
        return nil
    }
    
    static func save(user: User) {
        
        try! uiRealm.write {
            
            uiRealm.add(user, update: true)
        }
    }
}
