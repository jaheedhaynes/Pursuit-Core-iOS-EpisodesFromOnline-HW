//
//  TvShowEpisodeData.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Jaheed Haynes on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

//An image of the episode
//The name of the episode
//The season and episode number


import Foundation

struct EpidsodeList: Codable {
    let id: Int
    let name: String
    let season: Int
    let number: Int
    let image: EpiisodeImage
    let summary: String
}

struct EpiisodeImage: Codable {
  let medium: String
  let original: String
}
