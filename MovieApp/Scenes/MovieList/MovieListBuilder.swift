//
//  MovieListBuilder.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import UIKit

final class MovieListBuilder {
    static func make() -> MovieListViewController {
        let viewController = MovieListViewController(nibName: String(describing: MovieListViewController.self), bundle: nil)
        let router = MovieListRouter(view: viewController)
        let interactor = MovieListInteractor(service: TMDbAPI())
        let presenter = MovieListPresenter(view: viewController,
                                           interactor: interactor,
                                           router: router)
        viewController.presenter = presenter
        return viewController
    }
}
