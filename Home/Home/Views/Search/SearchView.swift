//
//  SearchView.swift
//  Home
//
//  Created by M. Rizki Maulana on 08/01/25.
//

import UIKit
import Shared

class SearchView: UIView {
  private let backgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = Color.primaryColor
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    view.layer.cornerRadius = 24
    view.layer.masksToBounds = true
    return view
  }()
  
  private let searchIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "magnifyingglass")
    imageView.tintColor = .white.withAlphaComponent(0.8)
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let searchTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Search"
    textField.textColor = .white
    textField.attributedPlaceholder = NSAttributedString(
      string: "Search",
      attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.8)]
    )
    textField.backgroundColor = .clear
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  private let searchContainer: UIView = {
    let view = UIView()
    view.backgroundColor = Color.primaryDarkColor
    view.layer.cornerRadius = 16
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }
  
  private func setupView() {
    addSubview(backgroundView)
    addSubview(searchContainer)
    searchContainer.addSubview(searchIcon)
    searchContainer.addSubview(searchTextField)
    
    NSLayoutConstraint.activate([
      backgroundView.topAnchor.constraint(equalTo: topAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      searchContainer.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      searchContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      searchContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      searchContainer.heightAnchor.constraint(equalToConstant: 50),
      
      searchIcon.leadingAnchor.constraint(equalTo: searchContainer.leadingAnchor, constant: 16),
      searchIcon.centerYAnchor.constraint(equalTo: searchContainer.centerYAnchor),
      searchIcon.widthAnchor.constraint(equalToConstant: 20),
      searchIcon.heightAnchor.constraint(equalToConstant: 20),
      
      searchTextField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 8),
      searchTextField.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor, constant: -16),
      searchTextField.centerYAnchor.constraint(equalTo: searchContainer.centerYAnchor),
      searchTextField.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
}
