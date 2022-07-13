//
//  Router.swift
//  BestMoviesApi
//
//  Created by Salih KIR on 30.06.2022.
//

import Foundation
import UIKit

final class AppRouter{
    
    static var shared = AppRouter()
    
    init() {}
    func showDetailPage(_navigationController: UINavigationController? , data: RandomResponseElement){
        let vc = DetailVC.instantiate(storyboard: .detail)
        let vm = DetailVM()
        vm.dataPacket = data
        vc.viewModel = vm
        _navigationController?.pushViewController(vc, animated: true)
    }
    func showDetailSearchFilmPage(_navigationController:UINavigationController? , data: Search){
        let vc = DetailVC.instantiate(storyboard: .detail)
        let vm = DetailVM()
        vm.dataAllFilm = data
        vc.viewModel = vm
        _navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func showDetailOneFilmPage(_navigationController:UINavigationController? , data: RandomoneMovie){
        let vc = DetailVC.instantiate(storyboard: .detail)
        let vm = DetailVM()
        vm.dataRandomOneMovie = data
        vc.viewModel = vm
        _navigationController?.pushViewController(vc, animated: true)
        
    }
//    func showFinallyLessonPage(_ navigationController: UINavigationController?, data: [Datum]){
//         let vc = FinallyLessonVC.instantiate(storyboard: .finallyLesson)
//         let vm = FinallyFlowVM()
//         vc.viewModel = vm
//         vm.data = data.reversed()
//         navigationController?.pushViewController(vc, animated: true)
//     }
}
