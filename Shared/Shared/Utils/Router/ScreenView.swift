//
//  ScreenView.swift
//  Shared
//
//  Created by M. Rizki Maulana on 19/12/24.
//

import UIKit

public enum ScreenType {
  case splash
  case home
  case homeDetail
  case search
  case youtube
}

public class ScreenView: ScreenViewProtocol {
  private var window: UIWindow?
  
  public var currentViewController: UIViewController? {
    return (window?.rootViewController as? UINavigationController)?.topViewController
  }
  
  public init(window: UIWindow?) {
    self.window = window
  }
  
  public func setRootViewController(_ viewController: UIViewController) {
    if let existingNavController = window?.rootViewController as? UINavigationController {
      existingNavController.setViewControllers([viewController], animated: false)
    } else {
      let navigationController = UINavigationController(rootViewController: viewController)
      window?.rootViewController = navigationController
      window?.makeKeyAndVisible()
    }
  }
  
  public func pushViewController(_ viewController: UIViewController) {
    guard let navigationController = currentViewController?.navigationController else {
      print("NavigationController not found.")
      return
    }
    navigationController.pushViewController(viewController, animated: true)
  }
  
  public func popToRootViewController() {
    currentViewController?.navigationController?.popToRootViewController(animated: true)
  }
  
  public func popViewController() {
    currentViewController?.navigationController?.popViewController(animated: true)
  }
}
