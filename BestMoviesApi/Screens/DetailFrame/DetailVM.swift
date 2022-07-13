//
//  DetailVM.swift
//  BestMoviesApi
//
//  Created by Salih KIR on 4.07.2022.
//

import Foundation
import UIKit

protocol DetailVMProtocol{
    
}

protocol DetailVMDelegate: DetailVMProtocol{
    var delegate: DetailVMDelegateOutPuts? {get set}
//    var data: RandomResponse? {get set}
    var dataPacket: RandomResponseElement? {get set}
    var dataAllFilm: Search? {get set}
}

protocol DetailVMDelegateOutPuts: AnyObject {
    
}

class DetailVM: DetailVMDelegate {    
//    var data: RandomResponse?
    var dataPacket: RandomResponseElement?
    var dataAll: AllMovie?
    var dataAllFilm: Search?
    var delegate: DetailVMDelegateOutPuts?
//    let network: Movie5ApiProtocol = API()
//
//    let url: String = "https://owen-wilson-wow-api.herokuapp.com/wows/random?results=5"
    
//    func getMovieData(){
//        network.movieDowlandMovie(url: url) { [weak self] (repo , err) in
//            if let repo = repo{
//                self?.data = repo
//            } else {
//                print(err)
//            }
//        }
//    }
    
}
