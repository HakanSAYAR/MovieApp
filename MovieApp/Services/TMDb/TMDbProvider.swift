//
//  TMDbProvider.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import Alamofire

struct TMDbPaths {
    static let movieUpcoming = "/3/movie/upcoming"
    static let searchMovie = "/3/search/movie"
}

enum TMDbProvider {
    case movieUpcoming(PageRequestModel)
    case searchMovie(SearchRequestModel, PageRequestModel)
}

extension TMDbProvider: NetworkRequestable {
    var path: String{
        switch self {
        case .movieUpcoming:
            return TMDbPaths.movieUpcoming
        case .searchMovie:
            return TMDbPaths.searchMovie
        }
    }
    
    var parameters: Parameters{
        var parameters = Parameters()
        switch self {
        case .movieUpcoming(let page):
            parameters = page.asDictionary()
            break
        case .searchMovie(let search, let page):
            parameters = search.asDictionary()
            parameters.append(dict: page.asDictionary())
            break
        }
        
        parameters.append(dict: DefaultRequestModel().asDictionary())
        return parameters
    }

    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    var encoding: ParameterEncoding {
        switch self {
        default:
            return URLEncoding.default
        }
    }
}

extension TMDbProvider: URLRequestConvertible{
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest = try encoding.encode(urlRequest, with: parameters)
        return urlRequest
    }
}
