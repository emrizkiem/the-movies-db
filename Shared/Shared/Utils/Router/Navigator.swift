//
//  Navigator.swift
//  Shared
//
//  Created by M. Rizki Maulana on 19/12/24.
//

import UIKit

public class Navigator {
  private var screenView: ScreenViewProtocol
  private var moduleFactory: ModuleFactoryProtocol
  
  public init(
    screenView: ScreenViewProtocol,
    moduleFactory: ModuleFactoryProtocol
  ) {
    self.screenView = screenView
    self.moduleFactory = moduleFactory
  }
  
  public func goTo(_ screenType: ScreenType) {
    switch screenType {
    case .splash:
      navigateToSplash()
    case .home,
        .homeDetail,
        .search,
        .youtube:
      break
    }
  }
  
  private func navigateToSplash() {
    let splashVC = moduleFactory.createSplashViewController()
    screenView.setRootViewController(splashVC)
  }
}
