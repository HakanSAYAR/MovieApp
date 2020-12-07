//
//  Dictionary+Extension.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import Foundation

extension Dictionary {
    mutating func append(dict: [Key: Value]){
        dict.forEach { (k, v) in
            updateValue(v, forKey: k)
        }
    }
}
