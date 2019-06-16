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
        userView.age      = user.age
        userView.userName = user.userName
        userView.password = user.password
        
        return userView
    }
    
    static func makeUser(name: String?, age: String?, username: String?, password: String?) -> Bool {
        
        if let name = name, let age = age, let username = username, let password = password {
            
            let newUser = User()
//            userCounter += 1
//            newUser.id = userCounter
            newUser.name = name
            newUser.age = age
            newUser.userName = username
            newUser.password = password

            self.save(user: newUser)
            
            return true
            
        } else {
            return false
        }
        
    }
    
    static func deleteAllUser() {
        try! uiRealm.write {
            uiRealm.deleteAll()
        }
    }
    
    static func getUserBy(username: String) -> UserView? {

        var user = UserView()

        if let result = uiRealm.object(ofType: User.self, forPrimaryKey: username) {
            
            user = self.getUserAsView(result)
            userCurrent = user
            return user
        }
        return nil
    }
//
//    static func getById(_ id: Int) -> CidadeView {
//
//        var cidadeView = CidadeView()
//
//        if let result = uiRealm.object(ofType: Cidade.self, forPrimaryKey: id) {
//
//            cidadeView = self.getCidadeAsView(cidade: result)
//        }
//
//        return cidadeView
//    }

    
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
