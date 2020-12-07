//
//  MovieListPresenter.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import Foundation

final class MovieListPresenter: MovieListPresenterProtocol {
    
    private unowned let view: MovieListViewProtocol
    private let interactor: MovieListInteractorProtocol
    private let router: MovieListRouterProtocol
    
    init(view: MovieListViewProtocol,
         interactor: MovieListInteractorProtocol,
         router: MovieListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
    
    func load() {
        view.handleOutput(.updateTitle("Movies"))
        interactor.load()
    }
    
    func search(with text: String?) {
        interactor.search(with: text)
    }
    
    func selectMovie(at index: Int) {
        interactor.selectMovie(at: index)
    }
}

extension MovieListPresenter: MovieListInteractorDelegate {
    func handleOutput(_ output: MovieListInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view.handleOutput(.setLoading(isLoading))
        case .showMovieList(let movies, let isLoadMore):
            let moviePresentations = movies.movies!.map(MoviePresentation.init)
            view.handleOutput(.showMovieList(moviePresentations, isLoadMore))
        case .showMovieDetail(let movie):
            router.navigate(to: .detail(movie))
        }
    }
}
