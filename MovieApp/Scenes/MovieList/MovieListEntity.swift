//
//  MovieListEntity.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import Foundation

struct MovieResponseModel: Decodable{
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
    
    let page: Int
    let movies: [Movie]?
    let totalResults: Int
    let totalPages: Int
}

struct Movie: Decodable{
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case poster = "poster_path"
        case voteAverage = "vote_average"
        case backdrop = "backdrop_path"
        case releaseDate = "release_date"
    }
    
    let id: Int
    let title: String?
    let overview: String?
    let poster: String?
    let voteAverage: Double?
    let releaseDate: String
    var backdrop: String?
    
    func backdropPath() -> String{
        return "\(Constants.storageBaseUrl)\(backdrop ?? "")"
    }
    func posterPath() -> String {
        return "\(Constants.storageBaseUrl)\(poster ?? "")"
    }
}

struct DefaultRequestModel: Encodable{
    var api_key: String = Constants.apiKey
}

struct PageRequestModel: Encodable{
    let page: Int
}

struct SearchRequestModel: Encodable{
    let query: String
}

//MARK: MovieList Presentation
final class MoviePresentation: NSObject {
    let title: String
    let image: String
    let vote: Double
    
    init(title: String,
         image: String,
         vote: Double) {
        self.title = title
        self.image = image
        self.vote = vote
        super.init()
    }
}

extension MoviePresentation {
    convenience init(movie: Movie) {
        self.init(title: movie.title!,
                  image: movie.posterPath(),
                  vote: movie.voteAverage ?? 0)
    }
}
