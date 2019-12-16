//
//  EpisodeTableViewCell.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Jaheed Haynes on 12/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

     @IBOutlet weak var episodeImage: UIImageView!
       @IBOutlet weak var episodeName: UILabel!
       @IBOutlet weak var season: UILabel!
       
       
       func loadCell(episode: EpidsodeList) {
           episodeName.text = episode.name
           season.text = "Season:\(episode.season) Episode:\(episode.number)"
           
        let episodeImage = episode.image.original 
           
        NetworkHelper.shared.performDataTask(with: episodeImage) { (result) in
               switch result {
               case .failure(let appError):
                   print("\(appError)")
               case .success(let data):
                   let image = UIImage(data: data)
                   DispatchQueue.main.async {
                       self.episodeImage.image = image
                   }
               }
           }
       }

}
