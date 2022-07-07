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
    @IBOutlet weak var tryView: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieTime: UILabel!
    @IBOutlet weak var videoOptions720P: UILabel!
    //@IBOutlet weak var videoOptions1080P: UILabel!
    var avpController = AVPlayerViewController()
    override func viewDidLoad() {
           super.viewDidLoad()
       // backGroundImageView.backgroundColor = UIColor(patternImage: UIImage(named: "cloud")!)
        navigationController?.navigationBar.isHidden = false
        stackView.layer.cornerRadius = 20
        tryImageView.layer.cornerRadius = 20
        tryView.layer.cornerRadius = 20
        if let dataposter = viewModel.dataPacket?.poster{
            tryImageView.downloaded(from: dataposter)
        }
        movieTime.text = viewModel.dataPacket?.timestamp
        movieNameLabel.text = viewModel.dataPacket?.movie
        videoOptions720P.text = viewModel.dataPacket?.video.the720P
        //videoOptions1080P.text = viewModel.dataPacket?.video.the1080P
       }
    
    @IBAction func videoShow1080P(_ sender: Any) {
       // print(viewModel.dataPacket?.video.the1080P as Any)
        if let video = viewModel.dataPacket?.video.the720P{
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
