//
//  ModuleFactoryProtocol.swift
//  Shared
//
//  Created by M. Rizki Maulana on 19/12/24.
//

import UIKit

public protocol ModuleFactoryProtocol {
  func createSplashViewController() -> UIViewController
  func createHomeViewController() -> UIViewController
  func createHomeDetailViewController() -> UIViewController
  func createSearchViewController() -> UIViewController
  func createYoutubeViewController() -> UIViewController
}
