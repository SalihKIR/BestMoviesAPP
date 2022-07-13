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
        var searchText = filmsSearchBar.text
        viewModelAllFilm.getmovieDowlandAllMovieNew(searchText: searchText ?? "")
    }
}

extension AllFilmsVC: AllFilmsVMDelegatesOutPuts {
    func reloadTabelView() {
        alllFilmsShowTabelView.reloadData()
    }
    
    
}

extension AllFilmsVC: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelAllFilm.dataAll?.search.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allFilmsCell = alllFilmsShowTabelView.dequeueReusableCell(withIdentifier: AllFilmsCell.identifier, for: indexPath) as! AllFilmsCell
        if let image = viewModelAllFilm.dataAll?.search[indexPath.row].poster{
            allFilmsCell.allFilmsImageView.downloaded(from: image)
        }
        allFilmsCell.movieFirstLabel.text = viewModelAllFilm.dataAll?.search[indexPath.row].title
        //allFilmsCell.movieSecondLabel.text = viewModelAllFilm.dataAll?.search[indexPath.row].type
        var randomIMDB = Float.random(in: 5.1...9.9)
        allFilmsCell.movieSecondLabel.text = String(randomIMDB)
        //allFilmsCell.movieSecondLabel.text =
        allFilmsCell.movieThirdLabel.text = viewModelAllFilm.dataAll?.search[indexPath.row].year
        
        return allFilmsCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 200.0
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let data = viewModelAllFilm.dataAll?.search[indexPath.row]{
            AppRouter.shared.showDetailSearchFilmPage(_navigationController: self.navigationController, data: data)
            
        }
        
    }
    
}
