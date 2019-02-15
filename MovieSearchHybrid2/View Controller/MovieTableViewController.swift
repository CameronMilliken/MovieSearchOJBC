//
//  MovieTableViewController.swift
//  MovieSearchHybrid2
//
//  Created by Cameron Milliken on 2/15/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var movie: [CRMMovie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        movieSearchBar.delegate = self

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        let movie = self.movie[indexPath.row]
        cell.movie = movie
        return cell
    }
}

// SearchBar Delegate
extension MovieTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {return}
        CRMMovieController.fetchMovie(withName: searchTerm.lowercased()) { (movies) in
            guard let movies = movies else {return}
            self.movie = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.movieSearchBar.text = ""
            }
        }
    }
}


