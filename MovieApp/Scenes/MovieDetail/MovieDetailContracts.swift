//
//  MovieDetailContracts.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import UIKit

// MARK: Presenter

protocol MovieDetailPresenterProtocol {
    func load()
}

// MARK: View

protocol MovieDetailViewProtocol: class {
    func update(_ presentation: MovieDetailPresentation)
}
