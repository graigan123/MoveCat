//
//  Movie.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 15/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import HandyJSON

class Movie: Object, HandyJSON {
    
    @objc dynamic var page = 1
    @objc dynamic var total_results = 1
    @objc dynamic var total_pages = 1
    var results: [MovieUnitary] = []
    
    override public static func primaryKey() -> String? {
        return "page"
    }

}

class MovieUnitary: Object, HandyJSON {
    
    @objc dynamic var vote_count = 1
    @objc dynamic var id = 1
    @objc dynamic var video = false
    @objc dynamic var vote_average = 0.0
    @objc dynamic var title = ""
    @objc dynamic var popularity = 0.0
    @objc dynamic var poster_path = ""
    @objc dynamic var original_language = ""
    @objc dynamic var original_title = ""
//    @objc dynamic var genre_ids =  []
    @objc dynamic var backdrop_path = ""
    @objc dynamic var adult = false
    @objc dynamic var overview = ""
    @objc dynamic var release_date = ""
    
    @objc dynamic var favorite = false
    
    override public static func primaryKey() -> String? {
        return "id"
    }
    
}
