//
//  MoveApi5.swift
//  BestMoviesApi
//
//  Created by Salih KIR on 30.06.2022.
//

import Foundation
protocol Movie5ApiProtocol {
    func movieDowlandMovie(url: String , completion: @escaping (RandomResponse? , String?) -> Void)
    func movieDowlandOneMovie(url: String , completion: @escaping (RandomoneMovie? , String?) -> Void)
    func movieDowlandAllMovieNew(page: Int , search: String , completion: @escaping (AllMovieNew? , String?) -> Void)

}


extension API: Movie5ApiProtocol {
    func movieDowlandAllMovieNew( page: Int , search: String, completion: @escaping (AllMovieNew?, String?) -> Void) {
        var url: String = "https://www.omdbapi.com/?apikey=de5d2fa8&s=\(search)&page=\(page)"

        network.getdata(url: url , completion: completion)
    }
    
//    func movieDowlandAllMovieNew(url: String, completion: @escaping (AllMovieNew?, String?) -> Void) {
//        network.getdata(url: url, completion: completion)
//    }
   
    func movieDowlandOneMovie(url: String, completion: @escaping (RandomoneMovie?, String?) -> Void) {
        network.getdata(url: url, completion: completion)
    }
    
    
    func movieDowlandMovie(url: String , completion: @escaping (RandomResponse? , String?) -> Void){
        network.getdata(url: url, completion: completion)
        
    }
}
