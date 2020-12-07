//
//  MovieListContracts.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import Foundation

// MARK: Interactor

protocol MovieListInteractorProtocol: class {
    var delegate: MovieListInteractorDelegate? { get set }
    func load()
    func search(with text: String?)
    func selectMovie(at index: Int)
}

enum MovieListInteractorOutput{
    case setLoading(Bool)
    case showMovieList(MovieResponseModel, Bool)
    case showMovieDetail(Movie)
}

protocol MovieListInteractorDelegate: class {
    func handleOutput(_ output: MovieListInteractorOutput)
}

// MARK: Presenter

protocol MovieListPresenterProtocol: class {
    func load()
    func search(with text: String?)
    func selectMovie(at index: Int)
}

enum MovieListPresenterOutput{
    case updateTitle(String)
    case setLoading(Bool)
    case showMovieList([MoviePresentation], Bool)
}

// MARK: View

protocol MovieListViewProtocol: class {
    func handleOutput(_ output: MovieListPresenterOutput)
}

// MARK: Router

enum MovieListRoute{
    case detail(Movie)
}

protocol MovieListRouterProtocol: class {
    func navigate(to route: MovieListRoute)
}
