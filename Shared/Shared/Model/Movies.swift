//
//  Movies.swift
//  Shared
//
//  Created by M. Rizki Maulana on 20/12/24.
//

import Foundation

public struct Movies: Decodable {
  public let page: Int
  public let totalPages: Int
  public let results: [MoviesItem]
  public let totalResults: Int
}

public struct MoviesItem: Decodable {
  public let id: Int
  public let title: String
  public let releaseDate: String
  public let voteAverage: Double
  public let voteCount: Int
  public let posterPath: String?
  public let backdropPath: String?
  public let overview: String
}
