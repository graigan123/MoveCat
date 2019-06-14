//
//  SectionControl.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 14/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import Foundation

class SessionControl {
    
    static func isDebug() -> Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    static var isSessionActive: Bool {
        
        // Testar se o usuário existe
        
        if let _  = SessionControl.user {
            
            return true
        }
        
        return false
        
        //        if UsuarioModelView.isTemUsuario() {
        //
        //            return true
        //        }
        //
        //        return false
    }
    
    //    class func setCredentialsOnHeader() {
    //
    //        Cookie.setCredentials()
    //    }
    //
    //    class func removeCredentialsFromHeader() {
    //
    //        Cookie.removeCredentials()
    //    }
    
    class var user: User? {
        
        if let user: User = UserModelView.getUser() {
            return user
        } else {
            return nil
        }
    }
}
