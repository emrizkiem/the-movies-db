//
//  UIFont.swift
//  TheMovieDb
//
//  Created by M. Rizki Maulana on 17/12/24.
//

import UIKit

extension UIFont {
  class func regularApplicationFont(withSize size: CGFloat) -> UIFont {
    guard let font = UIFont(name: Constants.Fonts.regular, size: size) else {
      return UIFont.systemFont(ofSize: size)
    }
    return font
  }
  
  class func mediumApplicationFont(withSize size: CGFloat) -> UIFont {
    guard let font = UIFont(name: Constants.Fonts.medium, size: size) else {
      return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.medium)
    }
    return font
  }
  
  class func boldApplicationFont(withSize size: CGFloat) -> UIFont {
    guard let font = UIFont(name: Constants.Fonts.bold, size: size) else {
      return UIFont.boldSystemFont(ofSize: size)
    }
    return font
  }
}
