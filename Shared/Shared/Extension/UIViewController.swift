//
//  UIViewController.swift
//  TheMovieDb
//
//  Created by M. Rizki Maulana on 17/12/24.
//

import UIKit

enum NavigationBarType {
  case backAndTitle(title: String?, color: UIColor?)
  case centerTitle(
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

extension UIViewController {
  private func setDefaultNavigationTheme() {
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.barTintColor  = Color.primaryViewColor
    navigationController?.interactivePopGestureRecognizer?.delegate = nil
  }
  
  func setNavigationBar(type: NavigationBarType) {
    setDefaultNavigationTheme()
    
    switch type {
    case .backAndTitle(let title, let color):
      if let theTitle = title, let titleColor = color {
        navigationItem.leftBarButtonItems = [createBackButton(), createTitleLabel(title: theTitle, color: titleColor)]
      } else {
        navigationItem.leftBarButtonItem = createBackButton()
      }
    case .centerTitle(
      let title,
      let titleSize,
      let titleColor,
      let backgroundColor
    ):
      if let theTitle = title, let titleSize = titleSize, let titleColor = titleColor, let backgroundColor = backgroundColor {
        let lblTitle = UILabel()
        lblTitle.text = theTitle
        lblTitle.font = .boldSystemFont(ofSize: titleSize)
        lblTitle.textColor = titleColor
        navigationItem.titleView = lblTitle
        navigationController?.navigationBar.backgroundColor = backgroundColor
      }
    }
  }
  
  private func createTitleLabel(title: String, color: UIColor) -> UIBarButtonItem {
    let titleLabel = UILabel()
    titleLabel.font = .regularApplicationFont(withSize: 16)
    titleLabel.text = title
    titleLabel.textColor = color
    return UIBarButtonItem(customView: titleLabel)
  }
  
  private func createBackButton() -> UIBarButtonItem {
    let iconBack = UIImage(systemName: "chevron.left")
    let backButton = UIBarButtonItem(
      image: iconBack,
      style: .plain,
      target: self,
      action: #selector(self.leftNavigationBarButtonTapped(sender:))
    )
    backButton.tintColor = .black
    return backButton
  }
}

extension UIViewController: NavigationBarButtonHandler {
  @objc func rightNavigationBarButtonTapped(sender: UIBarButtonItem?) {
  }
  
  @objc func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
  }
}

