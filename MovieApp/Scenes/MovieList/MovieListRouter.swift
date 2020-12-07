//
//  MovieListRouter.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import UIKit

final class MovieListRouter: MovieListRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: MovieListRoute) {
        switch route {
        case .detail(let movie):
            let detailView = MovieDetailBuilder.make(with: movie)
            view.show(detailView, sender: nil)
        }
    }
}
