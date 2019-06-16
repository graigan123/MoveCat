//
//  MovieService.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 15/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import HandyJSON
import SwiftyJSON

class MovieService: BaseService {
    
    var getListRequestFactory: Request?
    
    var delegate: StatefulViewControllerDelegate?
    
    required init(delegate: StatefulViewControllerDelegate) {
        self.delegate = delegate
    }
    
    func getListMovie() {
        
        self.getListRequestFactory?.cancel()
        
        self.getListRequestFactory = MovieRequestFactory.getAllMoviesList().responseJSON(completionHandler: { (response: DataResponse<Any>) in
            
            switch response.result {
                
            case .success:
                
                if let data = response.result.value {
                    let json = "\(JSON(data))"
                    
                    if let movies = JSONDeserializer<Movie>.deserializeFrom(json: json) {
                        
                        MovieListModelView.save(movies)
                        
                        for movie in movies.results {
                            MovieListModelView.saveUnitary(movie)
                        }
                        self.delegate?.success(.listMovie)
                    }
                }
                
                
                if let data = response.result.value {
                    let json = "\(JSON(data))"
                    var error = ""
                    
                    if json.contains("error") {
                        let tratarError = MessagesErrors()
                        error = tratarError.setJSON(json: json)
                    }
                    self.delegate?.success(.listMovie)
                }
                
                break
                
            case.failure:
                
                self.delegate?.failure(.listMovie, error: self.getError(response: response))
                
                break
            }
        })
    }
}
