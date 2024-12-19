//
//  Color.swift
//  TheMovieDb
//
//  Created by M. Rizki Maulana on 17/12/24.
//

import UIKit

public struct Color {
  public static let primaryColor     = UIColor(hex: "#B52B32")
  public static let primaryViewColor = UIColor(hex: "#1F1E1F")
  
  public static var gradientColorOrange: CAGradientLayer {
    let colorLeft = UIColor(red: 255/255, green: 183/255, blue: 78/255, alpha: 1.0).cgColor
    let colorRight = UIColor(red: 254/255, green: 130/255, blue: 23/255, alpha: 1.0).cgColor
    
    let grad = CAGradientLayer()
    grad.colors = [colorLeft, colorRight]
    grad.startPoint = CGPoint(x: 0, y: 0)
    grad.endPoint = CGPoint(x: 1, y: 0)
    return grad
  }
}
