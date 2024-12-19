//
//  ModuleFactory.swift
//  TheMovieDb
//
//  Created by M. Rizki Maulana on 19/12/24.
//

import UIKit
import Shared
import Splashscreen
import Home

public class ModuleFactory: ModuleFactoryProtocol {
  public init() {}
  
  public func createSplashViewController() -> UIViewController {
    return SplashViewController()
  }
  
  public func createHomeViewController() -> UIViewController {
    return HomeViewController()
  }
  
  public func createHomeDetailViewController() -> UIViewController {
    return UIViewController()
  }
  
  public func createSearchViewController() -> UIViewController {
    return UIViewController()
  }
  
  public func createYoutubeViewController() -> UIViewController {
    return UIViewController()
  }
}
