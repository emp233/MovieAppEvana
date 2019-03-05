//  
//  PopularService.swift
//  MovieAppEvana
//
//  Created by Evana Margain on 3/1/19.
//  Copyright © 2019 Evisoft. All rights reserved.
//

import Foundation
import Alamofire

class PopularListService: PopularListServiceProtocol {
    
    // Call protocol function

    func getPopularMovies(success: @escaping(_ data: Movie) -> (), failure: @escaping() -> ()) {

        let url = MovieAppConstants.popularURL
            
        APIManager.request(
            url,
            method: .get,
            parameters: [MovieAppConstants.apiKey : MovieAppConstants.apiKeyValue],
            encoding: URLEncoding.default,
            headers: [MovieAppConstants.headerContentType : MovieAppConstants.headerContentType],
            completion: { data in
                // mapping data
                do {
                    let decoded = try JSONDecoder().decode(Movie.self, from: data)
                    success(decoded)
                } catch {
                    
                    failure()
                }
                
        }) { errorMsg, errorCode in
            failure()
        }

    }

}
