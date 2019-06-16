//
//  MovieRequestFactory.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 15/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import Foundation
import Alamofire

class MovieRequestFactory {
    
    static func getAllMoviesList() -> DataRequest{
    
        return AF.request("https://api.themoviedb.org/3/movie/popular?api_key=81afa7538a18b6d631935dc9f370dad6", method: .get)
    }
}
