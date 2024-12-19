//
//  SplashViewModel.swift
//  Splashscreen
//
//  Created by M. Rizki Maulana on 19/12/24.
//

import Foundation

public class SplashViewModel {
  public var onAnimationCompleted: (() -> Void)?
  
  public func startAnimation() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.onAnimationCompleted?()
    }
  }
}
