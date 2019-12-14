//
//  TvShowData.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Jaheed Haynes on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct Show: Codable {
    let shows: ShowDetail
}

struct ShowDetail: Codable {
    let id: Int
    let name: String
    let rating: Rating
    let image: Image
}

struct Rating: Codable {
    let rating: Double
}

struct Image: Codable {
    let original: String
}
