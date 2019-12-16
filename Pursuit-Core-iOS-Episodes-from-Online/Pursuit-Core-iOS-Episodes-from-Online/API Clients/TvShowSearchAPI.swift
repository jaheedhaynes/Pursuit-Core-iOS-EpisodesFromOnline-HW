//
//  TvShowSearchAPI.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Jaheed Haynes on 12/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct TVShowSearchAPI {
    static func fetchShows(for searchQuery: String, completion: @escaping (Result<[Show], AppError>) -> ()) {
        
        let searchQuery = searchQuery.addingPercentEncoding(withAllowedCharacters:.urlHostAllowed) ?? "Soursop"
        
        let showEnpointURLString =  "http://api.tvmaze.com/search/shows?q=\(searchQuery)"
        
        NetworkHelper.shared.performDataTask(with: showEnpointURLString) { (result) in
            switch result {
                
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
                
            case .success(let data):
                do {
                    let questions = try JSONDecoder().decode([Show].self, from: data)
                    completion(.success(questions))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
