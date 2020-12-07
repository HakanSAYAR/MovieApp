//
//  NetworkRequestable.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import Alamofire

protocol NetworkRequestable {
    var path: String {get}
    var parameters: Parameters {get}
    var method: HTTPMethod {get}
    var encoding: ParameterEncoding {get}
}
