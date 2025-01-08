//
//  Images.swift
//  TheMovieDb
//
//  Created by M. Rizki Maulana on 17/12/24.
//

import UIKit

public struct Images {
  public struct Common {
    public static let imgSplash  = UIImage(named: "img_splash", in: Bundle(for: ImagesBundleToken.self), compatibleWith: nil)
    public static let iconBack   = UIImage(named: "ic_back", in: Bundle(for: ImagesBundleToken.self), compatibleWith: nil)
    public static let iconMenu   = UIImage(named: "ic_menu", in: Bundle(for: ImagesBundleToken.self), compatibleWith: nil)
  }
}

public class ImagesBundleToken {}

