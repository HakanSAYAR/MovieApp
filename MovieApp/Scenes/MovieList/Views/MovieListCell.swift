//
//  MovieListCell.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import UIKit

class MovieListCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    static let cellIdentifier = String(describing: MovieListCell.self)
    static let rowHeight: CGFloat = 192
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.layer.cornerRadius = 6
        posterImageView.clipsToBounds = true
        posterImageView.contentMode = .scaleAspectFill
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
        titleLabel.text = nil
    }
}

extension MovieListCell: CellPopulatable{
    func populate(with model: Any?) {
        guard let item = model as? MoviePresentation else{return}
        posterImageView.setImage(path: item.image)
        titleLabel.text = item.title
        voteLabel.text = "\(item.vote) / 10"
    }
}
