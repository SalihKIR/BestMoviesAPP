//
//  AllFilmsVM.swift
//  BestMoviesApi
//
//  Created by Salih KIR on 10.07.2022.
//

import Foundation
protocol AllFilmsVMProtocol{
    
}

protocol AllFilmsVMDelegate: AllFilmsVMProtocol{
    var delegate : AllFilmsVMDelegatesOutPuts? {get set}
    var dataAll : AllMovieNew? {get set}
    var dataPacketAllFilms: Search? {get set}
    
}
protocol AllFilmsVMDelegatesOutPuts: AnyObject {
    func reloadTabelView()
}

class AllFilmsVM: AllFilmsVMDelegate {
    var dataAll: AllMovieNew?
    var dataPacketAllFilms: Search?
    var delegate: AllFilmsVMDelegatesOutPuts?
    var network: Movie5ApiProtocol = API()
    
    
    func getmovieDowlandAllMovieNew(searchText: String){
        var url: String = "https://www.omdbapi.com/?apikey=de5d2fa8&s=\(searchText)&page=1"

        network.movieDowlandAllMovieNew(url: url) { [weak self] (response, err)  in
            if let response = response {
                self?.dataAll = response
            }else {
                print(err)
            }
            self?.delegate?.reloadTabelView()
        }
    }
}
