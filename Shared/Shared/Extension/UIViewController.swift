//
//  UIViewController.swift
//  TheMovieDb
//
//  Created by M. Rizki Maulana on 17/12/24.
//

import UIKit

public enum NavigationBarType {
  case backAndTitle(title: String?, color: UIColor?)
  case centerTitle(
    leftButtons: [UIBarButtonItem]?,
    title: String?,
    titleSize: CGFloat?,
    titleColor: UIColor?,
    backgroundColor: UIColor?
  )
}

protocol NavigationBarButtonHandler {
  func rightNavigationBarButtonTapped(sender: UIBarButtonItem?)
  func leftNavigationBarButtonTapped(sender: UIBarButtonItem?)
}

public extension UIViewController {
  private func setDefaultNavigationTheme() {
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = Color.primaryColor
    navigationController?.navigationBar.standardAppearance = appearance
    navigationController?.navigationBar.scrollEdgeAppearance = appearance
    navigationController?.interactivePopGestureRecognizer?.delegate = nil
  }
  
  func setNavigationBar(type: NavigationBarType) {
    setDefaultNavigationTheme()
    
    switch type {
    case .backAndTitle(let title, let color):
      setupBackAndTitle(title: title, color: color)
    case .centerTitle(let leftButtons, let title, let titleSize, let titleColor, let backgroundColor):
      setupCenterTitle(
        leftButtons: leftButtons,
        title: title,
        titleSize: titleSize,
        titleColor: titleColor,
        backgroundColor: backgroundColor
      )
    }
  }
  
  private func setupBackAndTitle(icon: String = "ic_back", title: String?, color: UIColor?) {
    navigationItem.leftBarButtonItem = createBackButton(icon: icon)
    
    if let title = title, let color = color {
      let titleLabel = createTitleLabel(title: title, color: color)
      navigationItem.leftBarButtonItems = [navigationItem.leftBarButtonItem!, titleLabel]
    }
  }
  
  private func setupCenterTitle(
    leftButtons: [UIBarButtonItem]?,
    title: String?,
    titleSize: CGFloat?,
    titleColor: UIColor?,
    backgroundColor: UIColor?
  ) {
    guard let navBar = navigationController?.navigationBar else { return }
    
    if let backgroundColor = backgroundColor {
      let backgroundView = UIView()
      backgroundView.backgroundColor = backgroundColor
      backgroundView.layer.cornerRadius = 20
      backgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
      backgroundView.translatesAutoresizingMaskIntoConstraints = false
      
      if let superview = navBar.superview {
        superview.insertSubview(backgroundView, belowSubview: navBar)
        
        NSLayoutConstraint.activate([
          backgroundView.topAnchor.constraint(equalTo: superview.topAnchor),
          backgroundView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
          backgroundView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
          backgroundView.heightAnchor.constraint(equalToConstant: 110) // Adjust height as needed
        ])
      }
    }
    
    navigationItem.leftBarButtonItems = leftButtons
    
    if let title = title, let titleSize = titleSize, let titleColor = titleColor {
      let lblTitle = UILabel()
      lblTitle.text = title
      lblTitle.font = .boldSystemFont(ofSize: titleSize)
      lblTitle.textColor = titleColor
      navigationItem.titleView = lblTitle
    }
    
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = backgroundColor
    appearance.shadowImage = nil
    appearance.shadowColor = .clear
    
    navBar.standardAppearance = appearance
    navBar.scrollEdgeAppearance = appearance
  }
  
  private func createTitleLabel(title: String, color: UIColor) -> UIBarButtonItem {
    let titleLabel = UILabel()
    titleLabel.font = .systemFont(ofSize: 16)
    titleLabel.text = title
    titleLabel.textColor = color
    return UIBarButtonItem(customView: titleLabel)
  }
  
  func createBackButton(icon: String) -> UIBarButtonItem {
    let iconBack = UIImage(named: icon, in: Bundle(for: ImagesBundleToken.self), compatibleWith: nil)
    let backButton = UIBarButtonItem(
      image: iconBack,
      style: .plain,
      target: self,
      action: #selector(self.leftNavigationBarButtonTapped(sender:))
    )
    backButton.tintColor = .white
    return backButton
  }
}

extension UIViewController: NavigationBarButtonHandler {
  @objc func rightNavigationBarButtonTapped(sender: UIBarButtonItem?) {
  }
  
  @objc func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
  }
}
