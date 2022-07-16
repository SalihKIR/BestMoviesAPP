//
//  AllFilmsVC.swift
//  BestMoviesApi
//
//  Created by Salih KIR on 10.07.2022.
//

import Foundation
import UIKit

class AllFilmsVC: UIViewController {

    var viewModelAllFilm: AllFilmsVM = AllFilmsVM()
    @IBOutlet weak var alllFilmsShowTabelView: UITableView!
    @IBOutlet weak var filmsSearchBar: UISearchBar!
    
    @IBOutlet weak var filmsSearchButton: UIButton!
    
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
        viewModelAllFilm.delegate = self
        alllFilmsShowTabelView.delegate = self
        alllFilmsShowTabelView.dataSource = self
        alllFilmsShowTabelView.register(AllFilmsCell.nibName, forCellReuseIdentifier: AllFilmsCell.identifier)
        filmsSearchBar.layer.cornerRadius = 20
        filmsSearchBar.layer.masksToBounds = true
        //filmsSearchButton.titleLabel?.text = "Ara"
        filmsSearchButton.layer.cornerRadius = 20
        
       }
    
    @IBAction func filmsSearchButton(_ sender: Any) {
        var searchBarText = filmsSearchBar.text
        SwiftSpinner.show("Loading")
        viewModelAllFilm.getMovieDownloadAllMovieNew(searchText: searchBarText ?? "")
        SwiftSpinner.hide()
    }
}

extension AllFilmsVC: AllFilmsVMDelegatesOutPuts {
    func emptySearch(anyResult: Bool) {
        print(anyResult)
    }
    
    func reloadTabelView() {
        alllFilmsShowTabelView.reloadData()
        SwiftSpinner.hide()

    }
    
    
}

extension AllFilmsVC: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelAllFilm.dataPacketAllFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allFilmsCell = alllFilmsShowTabelView.dequeueReusableCell(withIdentifier: AllFilmsCell.identifier, for: indexPath) as! AllFilmsCell
        let data = viewModelAllFilm.dataPacketAllFilms[indexPath.row]
            allFilmsCell.setText(data: data)
        SwiftSpinner.hide()
        if (Double(indexPath.row) * 100) / (100 * Double(viewModelAllFilm.dataPacketAllFilms.count)) > 0.8 {
            SwiftSpinner.show("Loading")
            viewModelAllFilm.getNewData()
            SwiftSpinner.hide()
            }
        return allFilmsCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 200.0
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if let data = viewModelAllFilm.dataAll?.search[indexPath.row]{
//            AppRouter.shared.showDetailSearchFilmPage(_navigationController: self.navigationController, data: data)
//
//        }
            AppRouter.shared.showDetailSearchFilmPage(_navigationController: self.navigationController, data: viewModelAllFilm.dataPacketAllFilms[indexPath.row])
        
        
    }
    
    
}
