//
//  MovieCell.swift
//  BestMoviesApi
//
//  Created by Salih KIR on 30.06.2022.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var cellMovieStackView: UIStackView!
    @IBOutlet weak var cellMovieİmage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellLabelDirector: UILabel!
    @IBOutlet weak var cellLabelYear: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
extension MovieCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
