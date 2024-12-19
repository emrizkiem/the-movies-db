//
//  ScreenViewProtocol.swift
//  Shared
//
//  Created by M. Rizki Maulana on 19/12/24.
//

import UIKit

public protocol ScreenViewProtocol {
  var currentViewController: UIViewController? { get }
  
  func setRootViewController(_ viewController: UIViewController)
  func pushViewController(_ viewController: UIViewController)
  func popToRootViewController()
  func popViewController()
}
