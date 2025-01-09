//
//  GenreCell.swift
//  Home
//
//  Created by M. Rizki Maulana on 09/01/25.
//

import UIKit
import Shared

class GenreCell: UICollectionViewCell {
  static let identifier = "GenreCell"
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = .systemFont(ofSize: 14, weight: .medium)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override var isSelected: Bool {
    didSet {
      if isSelected {
        contentView.backgroundColor = Color.primaryColor
        titleLabel.textColor = .white
        contentView.layer.borderWidth = 0
      } else {
        contentView.backgroundColor = .white
        titleLabel.textColor = .black
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray3.cgColor
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupCell()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupCell() {
    contentView.backgroundColor = .white
    contentView.layer.cornerRadius = 8
    contentView.layer.borderWidth = 1
    contentView.layer.borderColor = UIColor.systemGray3.cgColor
    contentView.clipsToBounds = true
    
    contentView.addSubview(titleLabel)
    
    NSLayoutConstraint.activate([
      titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      
      contentView.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
  
  func configure(with genre: String) {
    titleLabel.text = genre
  }
}
