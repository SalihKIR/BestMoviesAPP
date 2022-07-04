//
//  MovieCollectionCell.swift
//  BestMoviesApi
//
//  Created by Salih KIR on 2.07.2022.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {

    @IBOutlet weak var CollectionPage: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//    func setImage(data: RandomResponseElement) {
//        self.imageView.downloaded(from: data.poster)
//    }
}
extension MovieCollectionCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
