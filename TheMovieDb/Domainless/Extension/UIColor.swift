//
//  UIColor.swift
//  TheMovieDb
//
//  Created by M. Rizki Maulana on 17/12/24.
//

import UIKit

extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, Constants.Common.invalid)
    assert(green >= 0 && green <= 255, Constants.Common.invalid)
    assert(blue >= 0 && blue <= 255, Constants.Common.invalid)
    
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
  
  convenience init(hex: String, alpha: CGFloat = 1.0) {
    let hex: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let scanner = Scanner(string: hex)
    if (hex.hasPrefix(Constants.Common.hexColor)) {
      scanner.scanLocation = 1
    }
    var color: UInt32 = 0
    scanner.scanHexInt32(&color)
    let mask = 0x000000FF
    let r = Int(color >> 16) & mask
    let g = Int(color >> 8) & mask
    let b = Int(color) & mask
    let red   = CGFloat(r) / 255.0
    let green = CGFloat(g) / 255.0
    let blue  = CGFloat(b) / 255.0
    self.init(red:red, green:green, blue:blue, alpha:alpha)
  }
  
  var random: UIColor {
    let r = Int(arc4random_uniform(255))
    let g = Int(arc4random_uniform(255))
    let b = Int(arc4random_uniform(255))
    return UIColor(red: r, green: g, blue: b)
  }
  
  static func generateColor(hex: String?) -> UIColor {
    guard let hexa = hex else { return .white }
    return UIColor(hex: hexa)
  }
}
