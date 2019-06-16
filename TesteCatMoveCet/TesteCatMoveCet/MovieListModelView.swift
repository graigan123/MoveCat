//
//  MovieListModelView.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 15/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import Foundation

struct MovieUnitaryView {
    
    var vote_count = 1
    var id = 1
    var video = false
    var vote_average = 0.0
    var title = ""
    var popularity = 0.0
    var poster_path = ""
    var original_language = ""
    var original_title = ""
    
    var backdrop_path = ""
    var adult = false
    var overview = ""
    var release_date = ""
    
    var favortie = false
}

class MovieListModelView: ModelView {
    
    static func movieUnitaryModelAsView(movie: MovieUnitary) -> MovieUnitaryView {
        
        var movieView = MovieUnitaryView()
        
        
        movieView.vote_count        = movie.vote_count
        movieView.id                = movie.id
        movieView.video             = movie.video
        movieView.vote_average      = movie.vote_average
        movieView.title             = movie.title
        movieView.popularity        = movie.popularity
        movieView.poster_path       = movie.poster_path
        movieView.original_language = movie.original_language
        movieView.original_title    = movie.original_title
        movieView.backdrop_path     = movie.backdrop_path
        movieView.adult             = movie.adult
        movieView.overview          = movie.overview
        movieView.release_date      = movie.release_date
        movieView.favortie          = movie.favorite
        
        return movieView
    }
    
    static func getMovieBy(id: Int) -> MovieUnitaryView {
        
        var movie = MovieUnitaryView()
        
        if let result = uiRealm.object(ofType: MovieUnitary.self, forPrimaryKey: id) {
            
            movie = self.movieUnitaryModelAsView(movie: result)
        }
        return movie
    }
    
    static func getAllMovieUnitary() -> [MovieUnitaryView] {
        
        var movie: [MovieUnitaryView] = []
        
        let results = uiRealm.objects(MovieUnitary.self)

        for result in results {
            movie.append(self.movieUnitaryModelAsView(movie: result))
        }
        
        return movie
        
    }
    
    static func save(_ list: Movie) {
        try! uiRealm.write {
            uiRealm.add(list, update: true)
        }
    }
    
    static func setFavorite(id: Int) {
        
        
        let result = uiRealm.objects(MovieUnitary.self).filter("id == %@", id)
        
    }
    
    static func saveUnitary(_ movie: MovieUnitary) {
        
        if isHasInRealm(movie: movie) {
            return 
        }
        
        try! uiRealm.write {
            uiRealm.add(movie, update: true)
        }
    }
    
    static func isHasInRealm(movie: MovieUnitary) -> Bool {
        
        let result = uiRealm.objects(MovieUnitary.self).filter("id == %@", movie.id)
        
        if result.isEmpty {
            return false
        }
        
        return true
    }
}
