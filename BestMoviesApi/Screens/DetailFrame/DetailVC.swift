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
    @IBOutlet weak var tryImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieTime: UILabel!
    @IBOutlet weak var videoOptions720P: UILabel!
    @IBOutlet weak var videoOptions1080P: UILabel!
    var avpController = AVPlayerViewController()

    
    override func viewDidLoad() {
           super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        if let dataposter = viewModel.dataPacket?.poster{
            tryImageView.downloaded(from: dataposter)
        }
        movieTime.text = viewModel.dataPacket?.timestamp
        movieNameLabel.text = viewModel.dataPacket?.movie
        videoOptions720P.text = viewModel.dataPacket?.video.the720P
        videoOptions1080P.text = viewModel.dataPacket?.video.the1080P
       }
    
    @IBAction func videoShow1080P(_ sender: Any) {
        print(viewModel.dataPacket?.video.the1080P as Any)
        if let video = viewModel.dataPacket?.video.the1080P{
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
