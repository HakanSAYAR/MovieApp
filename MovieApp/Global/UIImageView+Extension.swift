//
//  UIImageView+Extension.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import UIKit
import Kingfisher

extension UIImageView{
    func setImage(path: String?, placeholder: UIImage? = nil, completion: ((Any?) -> Void)? = nil){
        self.kf.setImage(
            with: URL(string: path ?? ""),
            placeholder: placeholder, //TODO: set placeholder
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.5)),
                .cacheOriginalImage
            ], completionHandler:{ result in
                switch result {
                case .success( _):
//                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                    break
                case .failure( _):
//                    print("Job failed: \(error.localizedDescription)")
                    break
                }
            }
        )
   }
}

