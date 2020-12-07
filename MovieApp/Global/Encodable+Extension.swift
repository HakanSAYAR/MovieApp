//
//  Encodable+Extension.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self),
              let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            fatalError()
        }
        return dictionary
    }
}
