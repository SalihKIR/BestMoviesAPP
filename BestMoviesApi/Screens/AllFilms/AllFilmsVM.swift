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
    var dataPacketAllFilms: [Search] {get set}
    
}
protocol AllFilmsVMDelegatesOutPuts: AnyObject {
    func reloadTabelView()
    func emptySearch(anyResult: Bool)
}

class AllFilmsVM: AllFilmsVMDelegate {
    var dataPacketAllFilms: [Search] = []
    var page : Int = 1
    var searchText : String = ""
    
    var dataAll: AllMovieNew?
    var delegate: AllFilmsVMDelegatesOutPuts?
    var network: Movie5ApiProtocol = API()
   
    
    func getMovieDownloadAllMovieNew(searchText: String) {
        if searchText == "" {
            self.dataPacketAllFilms = []
            self.delegate?.reloadTabelView()
            self.delegate?.emptySearch(anyResult: false)
            
            return
        }
        
        network.movieDowlandAllMovieNew(page: page, search: searchText.replacingOccurrences(of: " ", with: "%20")) { [weak self] (response, err) in
            guard let self = self else {return}
            self.page = 1
            self.searchText = searchText
            if let response = response {
                self.dataPacketAllFilms = response.search
                let anyResult: Bool = response.search.count != 0
                self.delegate?.emptySearch(anyResult: anyResult)
            }else {
                self.dataPacketAllFilms = []
                self.delegate?.emptySearch(anyResult: false)
                print(err)
            }
            self.delegate?.reloadTabelView()
        }
    }
    
    func getNewData() {
        self.page += 1
        network.movieDowlandAllMovieNew(page: page, search: searchText.replacingOccurrences(of: " ", with: "%20")) { [weak self] (response , err ) in
            guard let self = self else {return}
            if let response = response {
                self.dataPacketAllFilms.append(contentsOf: response.search)
            }
            self.delegate?.reloadTabelView()
        }
    }

}
