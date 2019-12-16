//
//  ViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Benjamin Stone on 9/5/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class TVShowViewController: UIViewController {

    @IBOutlet weak var showTableView: UITableView!
    @IBOutlet weak var seearchBar: UISearchBar!
    
    
    var shows = [Show]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }

    func loadShows(for searchQuery: String) {
        TVShowSearchAPI.fetchShows(for: searchQuery) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let shows):
                self?.shows = shows
            }
        }
        print(shows.count)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            guard let episodeVC = segue.destination as? EpidodeViewController, let indexPath = showTableView.indexPathForSelectedRow else {
                fatalError("could not load")
            }
            episodeVC.showSelected = shows[indexPath.row]
        }

    }


