//
//  GenreCollectionViewCell.swift
//  Home
//
//  Created by M. Rizki Maulana on 09/01/25.
//

import UIKit
import Shared

class GenreCollectionViewCell: UIView {
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Recommended Movies"
    label.font = .systemFont(ofSize: 18, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var genreCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    layout.minimumInteritemSpacing = 8
    layout.minimumLineSpacing = 8
    
    let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.backgroundColor = .clear
    collection.showsHorizontalScrollIndicator = false
    collection.register(GenreCell.self, forCellWithReuseIdentifier: GenreCell.identifier)
    collection.translatesAutoresizingMaskIntoConstraints = false
    collection.delegate = self
    collection.dataSource = self
    collection.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
    return collection
  }()
  
  private var genres: [Genres.GenreItem] = []
  var onGenreSelected: ((Genres.GenreItem) -> Void)?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    backgroundColor = .white
    
    addSubview(titleLabel)
    addSubview(genreCollection)
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      
      genreCollection.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
      genreCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      genreCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
      genreCollection.heightAnchor.constraint(equalToConstant: 40),
      genreCollection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
    ])
  }
  
  func updateGenres(_ genres: [Genres.GenreItem]) {
    self.genres = genres
    genreCollection.reloadData()
    
    if !genres.isEmpty {
      let indexPath = IndexPath(item: 0, section: 0)
      genreCollection.selectItem(at: indexPath, animated: false, scrollPosition: [])
    }
  }
}

extension GenreCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return genres.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCell.identifier, for: indexPath) as? GenreCell else {
      return UICollectionViewCell()
    }
    
    let genre = genres[indexPath.item]
    cell.configure(with: genre.name)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let selectedGenre = genres[indexPath.item]
    onGenreSelected?(selectedGenre)
  }
}
