//
//  ModelView.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 14/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import Foundation
import RealmSwift

class ModelView {
    
    static func value<T>(_ element: T?) -> String {
        if let element = element {
            return String(describing: element)
        }
        return "-"
    }
}
