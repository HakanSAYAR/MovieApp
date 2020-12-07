//
//  MovieDetailBuilder.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import Foundation

final class MovieDetailBuilder {
    static func make(with movie: Movie) -> MovieDetailViewController {
        let viewController = MovieDetailViewController(nibName: String(describing: MovieDetailViewController.self), bundle: nil)
        let presenter = MovieDetailPresenter(view: viewController, movie: movie)
        viewController.presenter = presenter
        return viewController
    }
}
