//
//  EpidodeViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Jaheed Haynes on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpidodeViewController: UIViewController {

    @IBOutlet var episoodeTableView: UITableView!
    
    var episodes = [EpidsodeList]() {
        didSet {
            DispatchQueue.main.async {
                self.episoodeTableView.reloadData()
            }
        }
    }
    
    var showSelected: EpidsodeList?
    
    func loadEpisode(episodeID: Int) {
        TVShowEpisodeAPI.fetchEpisodes(for: episodeID) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let episode):
                DispatchQueue.main.async {
                    self?.episodes = episode
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let episodeDetailVC = segue.destination as? EpisodeDetailViewController, let indexpath = episoodeTableView.indexPathForSelectedRow else {
                fatalError()
            }
            episodeDetailVC.episodes = episodes[indexpath.row]
        }
    }

    
    



