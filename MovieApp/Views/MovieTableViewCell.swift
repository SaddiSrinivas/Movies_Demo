//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by mac on 15/01/21.
//

import UIKit

class MovieTableViewCell: TableViewCell {

    // MARK : - Properties
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverView: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieLanguage: UILabel!
    @IBOutlet weak var moviewPosterImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func configure(_ item: Any?) {
        
        guard let movie = item as? MoviesResults else { return }
        self.movieTitle.text = movie.title
        self.movieOverView.text = "Popularity: \(movie.popularity ?? 0)"
        self.movieReleaseDate.text = "Release Date: \(movie.release_date ?? "")"
        self.movieLanguage.text = "Original Language: \(movie.original_language ?? "")"
        ImageLoader().imageLoad(imgView: self.moviewPosterImageView, url: "\(ImageBaseURL)\(movie.poster_path ?? "")")
    }
}
