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
    override func viewDidLoad() {
           super.viewDidLoad()
        viewModelAllFilm.delegate = self
        viewModelAllFilm.getmovieDowlandAllMovieNew()
        alllFilmsShowTabelView.delegate = self
        alllFilmsShowTabelView.dataSource = self
        alllFilmsShowTabelView.register(AllFilmsCell.nibName, forCellReuseIdentifier: AllFilmsCell.identifier)
        
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
        
        return allFilmsCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 200.0
       }
    
}
