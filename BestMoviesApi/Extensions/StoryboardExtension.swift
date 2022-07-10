//
//  StoryboardExtension.swift
//  BestMoviesApi
//
//  Created by Salih KIR on 30.06.2022.
//

import Foundation
import UIKit

public enum StoryboardNames: String{
    case main = "Main"
    case detail = "Detail"
    case allFilm = "AllFilms"
}

protocol StoryboardSettings {
    var storyboardNames: StoryboardNames {get set}
}

public extension UIViewController {
    
    class func instantiate (storyboard: StoryboardNames = StoryboardNames.main , bundle: Bundle? = nil , identifier: String? = nil) -> Self{
        let viewControllerIdentifier = identifier ?? String(describing: self)
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: bundle)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as? Self else{preconditionFailure("Unable to instantiate view controller with identifier \(viewControllerIdentifier) as type \(type(of: self))")
        }
        return viewController
    }
}

