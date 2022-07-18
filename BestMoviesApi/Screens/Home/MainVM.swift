//
//  MainVM.swift
//  BestMoviesApi
//
//  Created by Salih KIR on 30.06.2022.
//

//import Foundation
//import UIKit
//
//protocol MainVMProtocol {
//
//}
//
//protocol MainVMDelegate: MainVMProtocol{
//    var delegate: MainVMDelegatesOutPuts? { get set }
//    var data: MoveAPI? { get set }
//
//}
//
//protocol MainVMDelegatesOutPuts: AnyObject {
//    func handleViewModelOutputs(_ viewModelOutputs: MainVMOutputs)
//    func reloadTableView()
//}
//enum MainVMOutputs{
//    case succes(MoveAPI)
//    case error
//}
//
//class MainVM: MainVMDelegate{
//    var data: MoveAPI?
//    var delegate: MainVMDelegatesOutPuts?
//    let network: MovieApiProtocol = API()
//    let url: String = "https://owen-wilson-wow-api.herokuapp.com/wows/random"
//
//    func getMovieData(){
//        network.movieDowlandMovie(url: url) { [weak self] (repo, err)  in
//            if let repo = repo {
//                self?.delegate?.handleViewModelOutputs(.succes(repo))
//                self?.data = repo
//            } else {
//                print(err)
//            }
//        }
//    }
//    private func handleViewModelOutputs(_ type: MainVMOutputs) {
//        self.delegate?.handleViewModelOutputs(type)
//    }
//}
import Foundation
import UIKit

protocol MainVMProtocol {
    
}

protocol MainVMDelegate: MainVMProtocol{
    var delegate: MainVMDelegatesOutPuts? { get set }
    //var delegateOneMovie: MainVMDelegatesOutPutsOneMovie? {get set}
    var data: RandomResponse? { get set }
    var dataPacket: RandomResponseElement? {get set}
    var dataRandomOneMovie: RandomoneMovie? {get set}
    var datajustone: RandomoneMovieElement? {get set}


}

protocol MainVMDelegatesOutPuts: AnyObject {
    func handleViewModelOutputs(_ viewModelOutputs: MainVMOutputsOnmeMovie)
    func reloadTableView()
    func reloadCollectionView()
}
//protocol MainVMDelegatesOutPutsOneMovie: AnyObject {
//    func handleViewModelOutputs(_ viewModelOutputs: MainVMOutputsOnmeMovie)
//}
enum MainVMOutputsOnmeMovie{
    case succes(RandomoneMovie)
    case error
}

class MainVM: MainVMDelegate{
//    var delegateOneMovie: MainVMDelegatesOutPutsOneMovie?
    var data: RandomResponse?
    var dataPacket: RandomResponseElement?
    var dataAll: AllMovie?
    var delegate: MainVMDelegatesOutPuts?
    let network: Movie5ApiProtocol = API()
    var dataRandomOneMovie: RandomoneMovie?
    var datajustone: RandomoneMovieElement?
    let url: String = "https://owen-wilson-wow-api.herokuapp.com/wows/random?results=5"
    
    func getMovieData(){
        network.movieDowlandMovie(url: url) { [weak self] (repo, err)  in
            if let repo = repo {
                self?.data = repo
                SwiftSpinner.hide()
            } else {
                print(err)
            }
            self?.delegate?.reloadTableView()
            self?.delegate?.reloadCollectionView()
        }
    }
    let urls: String = "https://owen-wilson-wow-api.herokuapp.com/wows/random"
    
    func getMovieoneData(){
        network.movieDowlandOneMovie(url: urls) { [weak self] (response, err)  in
            if let response = response {
                self?.dataRandomOneMovie = response
                self?.delegate?.handleViewModelOutputs(.succes(response))
                SwiftSpinner.hide()
            }else {
                print(err)
            }
           
        }
    }
        private func handleViewModelOutputs(_ type: MainVMOutputsOnmeMovie) {
            self.delegate?.handleViewModelOutputs(type)
        }
}
