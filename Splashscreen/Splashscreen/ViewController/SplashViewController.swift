//
//  SplashViewController.swift
//  TheMovieDb
//
//  Created by M. Rizki Maulana on 18/12/24.
//

import UIKit
import Shared

open class SplashViewController: BaseViewController {
  private let viewModel = SplashViewModel()
  
  private let logoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = Images.Common.imgSplash
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  open override func configureViews() {
    view.backgroundColor = Color.primaryColor
    
    setupLogo()
    startBounceAnimation()
  }
  
  private func setupLogo() {
    view.addSubview(logoImageView)

    NSLayoutConstraint.activate([
      logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      logoImageView.widthAnchor.constraint(equalToConstant: 200),
      logoImageView.heightAnchor.constraint(equalToConstant: 200)
    ])
  }
  
  private func bindViewModel() {
    viewModel.onAnimationCompleted = { [weak self] in
      
    }
  }
  
  private func startBounceAnimation() {
    logoImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    
    UIView.animate(
      withDuration: 1.0,
      delay: 0,
      usingSpringWithDamping: 0.5,
      initialSpringVelocity: 1.0,
      options: .curveEaseInOut,
      animations: {
        self.logoImageView.transform = .identity
      },
      completion: { [weak self] _ in
        self?.viewModel.startAnimation()
      }
    )
  }
}
