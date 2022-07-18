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
    @IBOutlet weak var clickableView: UIView!
    
    //MARK: UI
    @IBOutlet weak var topLeftImageView: UIView!
    @IBOutlet weak var detailRightLabel: UIView!
    @IBOutlet weak var fiveFilmsForLabel: UILabel!
    @IBOutlet weak var allFilms: UILabel!
    
    @IBOutlet weak var alphaTopView: UIView!
    @IBOutlet weak var pageController: UIPageControl!
    
    var cellTextImageIndex: Int = 0
    
    var viewModel: MainVM = MainVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftSpinner.show("Loading")
        setupUI()
        pageController.currentPage = 0
    
      
     
    }
    
    func setupUI() {
        viewModel.delegate = self
        viewModel.getMovieData()
        viewModel.getMovieoneData()
        
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.register(MovieCollectionCell.nibName, forCellWithReuseIdentifier: MovieCollectionCell.identifier)
        MovieTabelView.delegate = self
        MovieTabelView.dataSource = self
        MovieTabelView.register(MovieCell.nibName, forCellReuseIdentifier: MovieCell.identifier)
        //MARK: Func
        addNavigation()
        addTapGestureRecognizer()
        setRadius()
        setBackgroundColor()
        
    }
    
    func setBackgroundColor(){
        alphaTopView.backgroundColor = .black.withAlphaComponent(0.7)
    }
    
    func setRadius() {
        topLeftImageView.layer.cornerRadius = 16
        //detailRightLabel.layer.cornerRadius = 16
        //detailRightLabel.layer.masksToBounds = true
        fiveFilmsForLabel.layer.cornerRadius = 16
        fiveFilmsForLabel.layer.masksToBounds = true
        movieCollectionView.layer.cornerRadius = 16
        allFilms.layer.cornerRadius = 16
        allFilms.layer.masksToBounds = true
        MovieTabelView.layer.cornerRadius = 16
    }
    
    func addNavigation(){
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.bookmarks, target: self, action: #selector(allFilmShow))
    }
    
    func addTapGestureRecognizer(){
        let clickable = UITapGestureRecognizer(target: self, action: #selector(clicked))
        clickableView.addGestureRecognizer(clickable)
    }
    @objc func clicked(){
        if let data = viewModel.dataRandomOneMovie?.first{
            //AppRouter.shared.showDetailPage(_navigationController: self.navigationController, data: data )
            AppRouter.shared.showDetailOneFilmPage(_navigationController: self.navigationController, data: data)
        }
        
    }
    
    @objc func allFilmShow(){
        let vc = AllFilmsVC.instantiate(storyboard: .allFilm)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension Main: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectCell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionCell.identifier, for: indexPath) as! MovieCollectionCell
        collectCell.imageView.downloaded(from: viewModel.data?[indexPath.row].poster ?? "", contentMode: .scaleAspectFit)
        
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageController.numberOfPages = viewModel.data?.count ?? 0
        pageController.currentPage = indexPath.row
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
          for cell in movieCollectionView.visibleCells {
            if let row = movieCollectionView.indexPath(for: cell)?.item {
                pageController.currentPage = row
                cellTextImageIndex = row
            }
          }
      }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height = collectionView.layer.frame.height
        var widht = collectionView.layer.frame.width
        return CGSize(width: widht, height: height)
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
        movieCell.cellMovieİmage.downloaded(from: viewModel.data?[indexPath.row].poster ?? "", contentMode: .scaleAspectFit)
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
            randomImageView.contentMode = .scaleAspectFill
            randomMovieTimeLabel.text = viewModel.dataRandomOneMovie?[0].timestamp
            randomImageView.downloaded(from: viewModel.dataRandomOneMovie?[0].poster ?? "", contentMode: .scaleAspectFill)
        case .error:
            break
        }
    }
    
}
