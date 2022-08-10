//
//  DetailVC.swift
//  BestMoviesApi
//
//  Created by Salih KIR on 4.07.2022.
//

import Foundation
import AVFoundation
import AVKit
import UIKit
class DetailVC: UIViewController{
    var viewModel: DetailVM = DetailVM()
    @IBOutlet weak var backGroundImageView: UIImageView!
    @IBOutlet weak var tryImageView: UIImageView!
    @IBOutlet weak var moveDirector: UILabel!
    @IBOutlet weak var moveInformationFirst: UILabel!
    @IBOutlet weak var moveInformatinSecond: UILabel!
    @IBOutlet weak var movieTime: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var movieMidLabelFirst: UILabel!
    @IBOutlet weak var movieMidLabelSecond: UILabel!
    @IBOutlet weak var movieMidLabelThird: UILabel!
    
    @IBOutlet weak var movieBottomLabelFirst: UILabel!
    @IBOutlet weak var movieBottomLabelSecond: UILabel!
    @IBOutlet weak var movieBottomLabelThird: UILabel!
    
    //UISET
    @IBOutlet weak var viewCornerFirst: UIView!
    @IBOutlet weak var viewCornerSecond: UIView!
    @IBOutlet weak var viewCornerThird: UIView!
    @IBOutlet weak var viewCornerFourth: UIView!
    
    
    
    //@IBOutlet weak var videoOptions1080P: UILabel!
    var avpController = AVPlayerViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // backGroundImageView.backgroundColor = UIColor(patternImage: UIImage(named: "cloud")!)
        // navigationController?.navigationBar.isHidden = false
        stackView.layer.cornerRadius = 20
        tryImageView.layer.cornerRadius = 20
        setCorner()
        
        if let dataAllFilm = viewModel.dataAllFilm{
            searchAllFilmsPage(data: dataAllFilm)
        }
        if let dataFiveForYou = viewModel.dataPacket{
            
            SwiftSpinner.show("Loading...")
            fiveFilmForYou(data: dataFiveForYou)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.tryImageView.downloaded(from: dataFiveForYou.poster, contentMode: .scaleAspectFit)
                
            }
        }
        if let data = viewModel.dataRandomOneMovie {
            allFilmsVCPage(data: data)
            
        }
        //        movieTime.text = viewModel.dataPacket?.timestamp
        //        movieNameLabel.text = viewModel.dataPacket?.movie
        //        videoOptions720P.text = viewModel.dataPacket?.video.the720P
        //        //videoOptions1080P.text = viewModel.dataPacket?.video.the1080P
        //        moveDirector.text = viewModel.dataPacket?.director
        //        moveInformationFirst.text = viewModel.dataPacket?.character
        //        moveInformatinSecond.text = viewModel.dataPacket?.releaseDate
        //        movieNameLabel.text = viewModel.dataAllFilm?.title
        //        movieTime.text = viewModel.dataAllFilm?.year
        //        tryImageView.downloaded(from: viewModel.dataAllFilm?.poster ?? "", contentMode: .scaleAspectFit)
        // movieNameLabel.text = viewModel.dataPacket?.movie
    }
    func setCorner(){
        viewCornerFirst.layer.cornerRadius = 20
        viewCornerFirst.layer.masksToBounds = true
        viewCornerSecond.layer.cornerRadius = 20
        viewCornerSecond.layer.masksToBounds = true
        viewCornerThird.layer.cornerRadius = 20
        viewCornerThird.layer.masksToBounds = true
        viewCornerFourth.layer.cornerRadius = 20
        viewCornerFourth.layer.masksToBounds = true
        
    }
    func searchAllFilmsPage(data: Search){
        SwiftSpinner.show("Loading...")
        moveInformatinSecond.text = data.title
        tryImageView.downloaded(from: data.poster, contentMode: .scaleAspectFit)
        movieTime.text = data.year
        moveInformationFirst.text = data.imdbID
        moveDirector.text = data.type.rawValue
        movieMidLabelFirst.isHidden = true
        movieMidLabelSecond.isHidden = true
        movieMidLabelThird.isHidden = true
        movieBottomLabelFirst.isHidden = true
        movieBottomLabelSecond.isHidden = true
        movieBottomLabelThird.isHidden = true
        SwiftSpinner.hide()
    }
    func fiveFilmForYou(data: RandomResponseElement ){
        moveInformatinSecond.text = data.movie
        movieTime.text = data.timestamp
        moveInformationFirst.text = data.character
        moveDirector.text = data.director
        movieMidLabelFirst.text = data.fullLine
        movieMidLabelSecond.text = data.movieDuration
        movieMidLabelThird.text = data.releaseDate
        var year : String
        var current : String
        var total : String
        year = String(data.year)
        current = String(data.currentWowInMovie)
        total = String(data.totalWowsInMovie)
        movieBottomLabelFirst.text = year
        movieBottomLabelSecond.text = current
        movieBottomLabelThird.text = total
        SwiftSpinner.hide()
    }
    
    func allFilmsVCPage(data: RandomoneMovieElement){
        SwiftSpinner.show("Loading...")
        moveInformatinSecond.text = data.movie
        tryImageView.downloaded(from: data.poster, contentMode: .scaleAspectFit)
        movieTime.text = data.timestamp
        moveInformationFirst.text = data.character
        moveDirector.text = data.director
        movieMidLabelFirst.text = data.fullLine
        movieMidLabelSecond.text = data.movieDuration
        movieMidLabelThird.text = data.releaseDate
        var year : String
        var current : String
        var total : String
        year = String(data.year)
        current = String(data.currentWowInMovie)
        total = String(data.totalWowsInMovie)
        movieBottomLabelFirst.text = year
        movieBottomLabelSecond.text = current
        movieBottomLabelThird.text = total
        SwiftSpinner.hide()
    }
    
    @IBAction func videoShow1080P(_ sender: Any) {
        // print(viewModel.dataPacket?.video.the1080P as Any)
        if let video = viewModel.dataRandomOneMovie?.video.the720P{
            let videoURL = URL(string: video)
            let player = AVPlayer(url: videoURL!)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }
        
        
    }
    
}
