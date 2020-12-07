//
//  TMDbAPI.swift
//  MovieApp
//
//  Created by Hakan SAYAR on 6.12.2020.
//

import PromiseKit

typealias RequestBlock = ((DataRequest) -> ())

protocol TMDbApiProtocol{
    func movieUpcoming(model: PageRequestModel, onRequest: RequestBlock?) -> Promise<MovieResponseModel>
    func searchMovie(search: SearchRequestModel, page: PageRequestModel, onRequest: RequestBlock?) -> Promise<MovieResponseModel>
}

class TMDbAPI: TMDbApiProtocol {
    func movieUpcoming(model: PageRequestModel, onRequest: RequestBlock?) -> Promise<MovieResponseModel> {
        let request = Alamofire.request(TMDbProvider.movieUpcoming(model))
        onRequest?(request)
        return request
            .validate()
            .responseDecodable(MovieResponseModel.self)
    }
    
    func searchMovie(search: SearchRequestModel, page: PageRequestModel, onRequest: RequestBlock?) -> Promise<MovieResponseModel> {
        let request = Alamofire.request(TMDbProvider.searchMovie(search, page))
        onRequest?(request)
        return request
            .validate()
            .responseDecodable(MovieResponseModel.self)
    }
}
