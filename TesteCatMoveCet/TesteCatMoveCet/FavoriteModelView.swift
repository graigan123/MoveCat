////
////  FavoriteModelView.swift
////  TesteCatMoveCet
////
////  Created by Diego Azevedo Vasconcelos on 15/06/19.
////  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
////
//
//import Foundation
//import RealmSwift
//
//struct FavoriteView {
//    
//    var movie = MovieUnitaryView()
//}
//
//class FavoriteModelView: ModelView {
//    
//    static func getFavoriteModelAsView(favorite: MovieUnitary) -> FavoriteView {
//        
//        var favoriteView = FavoriteView()
//        
//        favoriteView.movie = favorite
//        
//        return favoriteView
//    }
//    
//    static func getFavorite() -> FavoriteView {
//        
//        
//        
//        let result = uiRealm.objects(Favorite.self)
//        
//        
//        
//        return self.getFavoriteModelAsView(favorite: result)
//    }
//    
//    static func save(_ favorite: Favorite)  {
//    
//        try! uiRealm.write {
//            uiRealm.add(favorite, update: true)
//        }
//    }
//}
