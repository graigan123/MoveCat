//
//  Realm.swift
//  SysZone
//
//  Created by tmp_user on 28/12/18.
//  Copyright © 2018 tmp_user. All rights reserved.
//

import Foundation
import RealmSwift

extension Realm {
    
    static func clearDatabase() {
        do {
            try uiRealm.write {
                uiRealm.deleteAll()
            }
        } catch  {
            print("Não foi possível excluir o banco de dados.")
        }
    }
    
    static func showPath() {
        if SessionControl.isDebug() {
            if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last?.path {
                print("\nDOCUMENTS >> \(url)")
            }
        }
    }
}
