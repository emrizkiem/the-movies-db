//
//  UIImage.swift
//  TheMovieDb
//
//  Created by M. Rizki Maulana on 17/12/24.
//

import UIKit

extension UIImage {
  func resizeImg(targetSize: CGSize) -> UIImage {
    return UIGraphicsImageRenderer(size:targetSize).image { _ in
      self.draw(in: CGRect(origin: .zero, size: targetSize))
    }
  }
}
