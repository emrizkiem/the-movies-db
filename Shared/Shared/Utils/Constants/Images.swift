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
    public static let iconBack   = UIImage(named: "icon-back", in: Bundle(for: ImagesBundleToken.self), compatibleWith: nil)
  }
}

private class ImagesBundleToken {}

