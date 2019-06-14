//
//  ObjectMapper.swift
//  SysZone
//
//  Created by tmp_user on 28/12/18.
//  Copyright © 2018 tmp_user. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class ListTransform<T: RealmSwift.Object>: TransformType where T: Mappable {
    
    public init() { }
    
    public typealias Object = List<T>
    public typealias JSON = Array<Any>
    
    public func transformFromJSON(_ value: Any?) -> List<T>? {
        if let objects = Mapper<T>().mapArray(JSONObject: value) {
            let list = List<T>()
            list.append(objectsIn: objects)
            return list
        }
        return nil
    }
    
    public func transformToJSON(_ value: Object?) -> JSON? {
        return value?.compactMap { $0.toJSON() }
    }
}
