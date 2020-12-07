//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import UIKit

final class MovieDetailViewController: UIViewController {

    @IBOutlet private var coverImageView: UIImageView!
    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var voteLabel: UILabel!
    @IBOutlet private var overviewLabel: UILabel!
    
    var presenter: MovieDetailPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.load()
    }
    
    private func setup() {
        posterImageView.layer.cornerRadius = 6
        posterImageView.layer.masksToBounds = true
    }
}

extension MovieDetailViewController: MovieDetailViewProtocol{
    func update(_ presentation: MovieDetailPresentation) {
        coverImageView.setImage(path: presentation.backdrop)
        posterImageView.setImage(path: presentation.poster)
        titleLabel.text = presentation.title
        dateLabel.text = presentation.date
        voteLabel.text = "\(presentation.vote) / 10"
        overviewLabel.text = presentation.overview
    }
}
