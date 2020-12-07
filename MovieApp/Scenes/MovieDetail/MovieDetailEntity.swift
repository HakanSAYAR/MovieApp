//
//  MovieDetailEntity.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import Foundation

//MARK: MovieList Presentation
final class MovieDetailPresentation: NSObject {
    let id: Int
    let title: String?
    let backdrop: String?
    let poster: String?
    let overview: String?
    let vote: Double
    let date: String?
    
    init(id: Int,
         title: String?,
         backdrop: String?,
         poster: String?,
         overview: String?,
         vote: Double,
         date: String?) {
        self.id = id
        self.title = title
        self.backdrop = backdrop
        self.poster = poster
        self.overview = overview
        self.vote = vote
        self.date = date
        
        super.init()
    }
}

extension MovieDetailPresentation {
    convenience init(movie: Movie) {
        self.init(id: movie.id,
                  title: movie.title,
                  backdrop: movie.backdropPath(),
                  poster: movie.posterPath(),
                  overview: movie.overview,
                  vote: movie.voteAverage ?? 0,
                  date: movie.releaseDate)
    }
}
