//
//  SplashViewController.swift
//  TheMovieDb
//
//  Created by M. Rizki Maulana on 18/12/24.
//

import UIKit
import Shared

public class SplashViewController: UIViewController, NavigatorProtocol {
  private let viewModel = SplashViewModel()
  public var navigator: Navigator?
  
  private let logoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = Images.Common.imgSplash
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  public init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Color.primaryColor
    
    setupLogo()
    bindViewModel()
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
      self?.navigator?.goTo(.home)
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
