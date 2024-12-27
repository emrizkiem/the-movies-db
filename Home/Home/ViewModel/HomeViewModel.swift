//
//  HomeViewModel.swift
//  Home
//
//  Created by M. Rizki Maulana on 19/12/24.
//

import UIKit
import Combine
import Shared

public class HomeViewModel {
  @Published var genres: [Genres.GenreItem] = []
  @Published var errorMessage: String?
  
  private var cancellables: Set<AnyCancellable> = []
  private let networkService: NetworkServiceProtocol
  
  public init(networkService: NetworkServiceProtocol = NetworkService()) {
    self.networkService = networkService
  }
  
  public func fetchGenre() {
    let endpoint = NetworkEndpoints.genre
    networkService.request(endpoint: endpoint)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .finished:
          break
        case .failure(let error):
          self.errorMessage = error.localizedDescription
        }
      }, receiveValue: { (response: Genres) in
        self.genres = response.genres
      })
      .store(in: &self.cancellables)
  }
}
