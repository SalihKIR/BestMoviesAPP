//
//  ViewController.swift
//  BestMoviesApi
//
//  Created by Salih KIR on 30.06.2022.
//

import UIKit

class Main: UIViewController {
    @IBOutlet weak var randomMovieTimeLabel: UILabel!
    @IBOutlet weak var randomMovieNameLabel: UILabel!
    @IBOutlet weak var randomMovieDirecterLabel: UILabel!
    @IBOutlet weak var randomImageView: UIImageView!
    @IBOutlet weak var MovieTabelView: UITableView!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    var viewModel: MainVM = MainVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        viewModel.getMovieData()
        viewModel.getMovieoneData()
        viewModel.getAllMovie()
        navigationController?.navigationBar.isHidden = true
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.register(MovieCollectionCell.nibName, forCellWithReuseIdentifier: MovieCollectionCell.identifier)
        MovieTabelView.delegate = self
        MovieTabelView.dataSource = self
        MovieTabelView.register(MovieCell.nibName, forCellReuseIdentifier: MovieCell.identifier)
        
       // Deneme.text = viewModel.data?[0].movie
    }
}

extension Main: UICollectionViewDelegate , UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectCell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionCell.identifier, for: indexPath) as! MovieCollectionCell
        collectCell.imageView.downloaded(from: (viewModel.data?[indexPath.row].poster) ?? "")
//        if let data = viewModel.data {
//            collectCell.setImage(data: data[indexPath.row] )
//        }
        
        return collectCell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.data?.count ?? 0
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = viewModel.data?[indexPath.row]{
            AppRouter.shared.showDetailPage(_navigationController: self.navigationController, data: data)
        }
        
    }
    
    
    
}
                        /// TabelView ///
extension Main: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data?.count ?? 0//Just Zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = MovieTabelView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
       // movieCell.cellLabelDirector.text = viewModel.data?[indexPath.row].director
        movieCell.cellLabelDirector.text = viewModel.data?[indexPath.row].director
        movieCell.cellLabelYear.text = viewModel.data?[indexPath.row].timestamp
        movieCell.cellLabel.text = viewModel.data?[indexPath.row].movie
        movieCell.cellMovieİmage.downloaded(from: viewModel.data?[indexPath.row].poster ?? "")
        return movieCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = viewModel.data?[indexPath.row]{
            AppRouter.shared.showDetailPage(_navigationController: self.navigationController, data: data)
        }

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 200.0
       }
}
extension Main: MainVMDelegatesOutPuts{
  
    func reloadTableView() {
            self.MovieTabelView.reloadData()
        }
    
    func reloadCollectionView() {
        self.movieCollectionView.reloadData()
    }
    
    func handleViewModelOutputs(_ viewModelOutputs: MainVMOutputsOnmeMovie) {
        switch viewModelOutputs {
        case .succes(let movie):
            print(movie)
            randomMovieNameLabel.text = movie[0].movie
            randomMovieTimeLabel.text = movie[0].timestamp
            randomImageView.downloaded(from: movie[0].poster)
           // randomMovieTimeLabel.text = viewModel.dataRandomOneMovie?[0].timestamp
            randomImageView.downloaded(from: viewModel.dataRandomOneMovie?[0].poster ?? "")
        case .error:
            break
        }
    }

}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
