//
//  MovieListInteractor.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import Foundation
import Alamofire

final class MovieListInteractor: MovieListInteractorProtocol {
    
    weak var delegate: MovieListInteractorDelegate?
    private let service: TMDbApiProtocol
    private var movies: [Movie] = []
    private var page: Int = 1
    private var totalPages: Int = Int.max
    private var searchText: String?
    private var lastRequest: DataRequest?
    
    init(service: TMDbApiProtocol) {
        self.service = service
    }

    func load() {
        if searchText?.isEmpty == true || searchText == nil{
            movieUpcoming()
        }else{
            searchMovie(with: searchText)
        }
    }
    
    func search(with text: String?) {
        resetSearch(text: text)
        load()
    }
    
    func selectMovie(at index: Int) {
        let movie = movies[index]
        delegate?.handleOutput(.showMovieDetail(movie))
    }
    
    func movieUpcoming(){
        if page > totalPages {return}
        delegate?.handleOutput(.setLoading(true))
        
        service.movieUpcoming(model: PageRequestModel(page: page), onRequest: {[weak self] (request) in
            self?.lastRequest?.cancel()
            self?.lastRequest = request
        }).done { (result) in
            guard let movies = result.movies else {return}
            if self.page == 1{
                self.movies = movies
                self.delegate?.handleOutput(.showMovieList(result, false))
            }else{
                self.movies.append(contentsOf: movies)
                self.delegate?.handleOutput(.showMovieList(result, true))
            }
            self.totalPages = result.totalPages
            self.page += 1
        }.catch { (error) in
            //TODO: handle error
        }.finally {
            self.delegate?.handleOutput(.setLoading(false))
        }
    }
    
    func searchMovie(with text: String?){
        guard let query = text else {return}
        if page > totalPages {return}
        delegate?.handleOutput(.setLoading(true))
        service.searchMovie(search: SearchRequestModel(query: query), page: PageRequestModel(page: page), onRequest: {[weak self] (request) in
            self?.lastRequest?.cancel()
            self?.lastRequest = request
        }).done { (result) in
            guard let movies = result.movies else {return}
            if self.page == 1{
                self.movies = movies
                self.delegate?.handleOutput(.showMovieList(result, false))
            }else{
                self.movies.append(contentsOf: movies)
                self.delegate?.handleOutput(.showMovieList(result, true))
            }
            self.totalPages = result.totalPages
            self.page += 1
        }.catch { (error) in
            //TODO: handle error
        }.finally {
            self.delegate?.handleOutput(.setLoading(false))
        }
    }
    
    func resetSearch(text: String?){
        searchText = text
        page = 1
        totalPages = Int.max
    }
}
