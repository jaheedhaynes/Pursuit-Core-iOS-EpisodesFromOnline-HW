//
//  TvShowEpisodes.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Jaheed Haynes on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct TVShowEpisodeAPI {
    static func fetchEpisodes(for episodeID: Int, completion: @escaping (Result<[EpidsodeList], AppError>) -> ()) {
        
        let endpointUrlString = "http://api.tvmaze.com/shows/\(episodeID)/episodes"
        
        NetworkHelper.shared.performDataTask(with: endpointUrlString) { (result) in
            switch result {
                
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
                
            case .success(let data):
                do {
                    let episodes = try JSONDecoder().decode([EpidsodeList].self, from: data)
                    dump(episodes.count)
                    completion(.success(episodes))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
