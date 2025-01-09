//
//  HomeViewController.swift
//  Home
//
//  Created by M. Rizki Maulana on 19/12/24.
//

import UIKit
import Combine
import Shared

public class HomeViewController: UIViewController {
  private let viewModel = HomeViewModel()
  private var cancellables = Set<AnyCancellable>()
  private let searchView = SearchView()
  private let genreView = GenreCollectionViewCell()
  
  public init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    initNavigationBar()
    initSearchView()
    initGenreView()
    bindViewModel()
    viewModel.fetchGenre()
  }
  
  private func initNavigationBar() {
    setNavigationBar(type: .centerTitle(
      leftButtons: [createBackButton(icon: "ic_menu")],
      title: "Hey, Rizki Maul!",
      titleSize: 18,
      titleColor: .white,
      backgroundColor: Color.primaryColor
    ))
  }
  
  private func initSearchView() {
    searchView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(searchView)
    
    NSLayoutConstraint.activate([
      searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      searchView.heightAnchor.constraint(equalToConstant: 100)
    ])
  }
  
  private func initGenreView() {
    genreView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(genreView)
    
    NSLayoutConstraint.activate([
      genreView.topAnchor.constraint(equalTo: searchView.bottomAnchor),
      genreView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      genreView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
    
    genreView.onGenreSelected = { [weak self] genre in
      self?.handleGenreSelection(genre)
    }
  }
  
  private func bindViewModel() {
    viewModel.$genres
      .receive(on: DispatchQueue.main)
      .sink { [weak self] genre in
        self?.genreView.updateGenres(genre)
      }
      .store(in: &cancellables)
    
    viewModel.$errorMessage
      .receive(on: DispatchQueue.main)
      .compactMap { $0 }
      .sink { [weak self] error in
        self?.handleError(error)
      }
      .store(in: &cancellables)
  }
  
  private func handleGenreSelection(_ genre: Genres.GenreItem) {
    print("Selected genre: \(genre.name) with ID: \(genre.id)")
  }
  
  private func handleError(_ error: String) {
    print("Error loading genres: \(error)")
  }
}
