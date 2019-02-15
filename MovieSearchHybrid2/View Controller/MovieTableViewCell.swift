//
//  MovieTableViewCell.swift
//  MovieSearchHybrid2
//
//  Created by Cameron Milliken on 2/15/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var moviePosterImage: UIImageView!
    
    
    var movie: CRMMovie? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let movie = movie else {return}
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = "Rating: \(movie.rating)"
        movieOverviewLabel.text = movie.overview
        CRMMovieController.fetchImage(with: movie) { (image) in
            guard let image = image else {return}
            DispatchQueue.main.async {
                self.moviePosterImage.image = image
            }
            
        }
        
    }
    
}
