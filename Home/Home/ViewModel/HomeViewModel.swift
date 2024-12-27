//
//  HomeViewModel.swift
//  Home
//
//  Created by M. Rizki Maulana on 19/12/24.
//

import UIKit
import Shared

public class HomeViewModel {
  private let networkService = NetworkService()
  private let endpoint = NetworkEndpoints.genre
  
  public init() {}
  
  public func fetchGenre() {
    networkService.request(endpoint: endpoint) { (result: Result<Genres, Error>) in
      switch result {
      case .success(let genres):
        for genre in genres.genres {
          print(genre)
        }
      case .failure(let error):
        print("Error: \(error.localizedDescription)")
      }
    }
  }
}
