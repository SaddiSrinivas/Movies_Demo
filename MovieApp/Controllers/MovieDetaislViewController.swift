//
//  MovieDetaislViewController.swift
//  MovieApp
//
//  Created by mac on 15/01/21.
//

import UIKit

class MovieDetaislViewController: UIViewController {

    // MARK : - properties
    
    @IBOutlet weak var moviePostImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieOverviewText: UITextView!
    @IBOutlet weak var ratingLabel: UILabel!
        
    
    var movie:MoviesResults?
    
    // MARK : - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMovieDetails()
    }

    
    private func loadMovieDetails() {
        
        guard let movie = movie else { return }
        self.movieTitleLabel.text = movie.title
        self.movieOverviewText.text = movie.overview
        self.ratingLabel.text = "❤️ \(movie.vote_average ?? 0)"
        ImageLoader().imageLoad(imgView: self.moviePostImageView, url: "\(ImageBaseURL)\(movie.backdrop_path ?? "")")
    }

    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
