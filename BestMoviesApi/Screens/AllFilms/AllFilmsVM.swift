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
    
}
protocol AllFilmsVMDelegatesOutPuts: AnyObject {
    func reloadTabelView()
}

class AllFilmsVM: AllFilmsVMDelegate {
    var dataAll: AllMovieNew?
    var delegate: AllFilmsVMDelegatesOutPuts?
    var network: Movie5ApiProtocol = API()
    
    let url: String = "https://www.omdbapi.com/?apikey=de5d2fa8&s=search&page=1"
    
    func getmovieDowlandAllMovieNew(){
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
