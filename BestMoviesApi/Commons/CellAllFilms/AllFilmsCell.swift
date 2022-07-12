//
//  AllFilmsCell.swift
//  BestMoviesApi
//
//  Created by Salih KIR on 10.07.2022.
//

import UIKit

class AllFilmsCell: UITableViewCell {
    @IBOutlet weak var allFilmsImageView: UIImageView!
    @IBOutlet weak var movieFirstLabel: UILabel!
    @IBOutlet weak var movieSecondLabel: UILabel!
    @IBOutlet weak var movieThirdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
}
extension AllFilmsCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
