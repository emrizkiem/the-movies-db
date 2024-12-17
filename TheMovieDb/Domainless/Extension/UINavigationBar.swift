//
//  UINavigationBar.swift
//  TheMovieDb
//
//  Created by M. Rizki Maulana on 17/12/24.
//

import UIKit

extension UINavigationBar {
  func transparentNavigationBar() {
    self.setBackgroundImage(UIImage(), for: .default)
    self.shadowImage = UIImage()
    self.isTranslucent = true
  }
  
  func removeTransparancy() {
    self.setBackgroundImage(nil, for: .default)
    self.shadowImage = UIImage()
    self.isTranslucent = true
  }
}
