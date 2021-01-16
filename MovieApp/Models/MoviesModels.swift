//
//  MoviesModels.swift
//  MovieApp
//
//  Created by mac on 15/01/21.
//

import Foundation

// MARK : - TopRated Movies Model

struct TopRatedMovies : Codable {
    
    let page : Int?
    let results : [MoviesResults]?
    let total_pages : Int?
    let total_results : Int?
    
}

struct MoviesResults : Codable {
    
    let adult : Bool?
    let backdrop_path : String?
    let genre_ids : [Int]?
    let id : Int?
    let original_language : String?
    let original_title : String?
    let overview : String?
    let popularity : Double?
    let poster_path : String?
    let release_date : String?
    let title : String?
    let video : Bool?
    let vote_average : Double?
    let vote_count : Int?
    
}

// MARK : - Upcoming Movies Model

struct UpcomingMovies : Codable {
    
    let dates : Date?
    let page : Int?
    let results : [MoviesResults]?
    let total_pages : Int?
    let total_results : Int?
    
}

struct Date : Codable {
    
    let maximum : String?
    let minimum : String?
    
}
