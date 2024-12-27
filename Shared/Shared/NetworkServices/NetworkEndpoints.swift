//
//  NetworkEndpoints.swift
//  Shared
//
//  Created by M. Rizki Maulana on 20/12/24.
//

import UIKit

public enum NetworkEndpoints {
  case genre
  case moviesByGenre(withGenre: String)
  case nowPlaying
  case moviesDetails(movieId: Int)
  case videos(movieId: Int)
  case cast(movieId: Int)
  
  private var path: String {
    switch self {
    case .genre:
      return "genre/movie/list"
    case .moviesByGenre:
      return "discover/movie?language=en-US"
    case .nowPlaying:
      return "movie/now_playing?language=en-US"
    case .moviesDetails(let movieId):
      return "movie/\(movieId)?language=en-US"
    case .videos(let movieId):
      return "movie/\(movieId)/videos?language=en-US"
    case .cast(let movieId):
      return "movie/\(movieId)/credits??language=en-US"
    }
  }
  
  private var queryParameters: [String: String]? {
    switch self {
    case .genre:
      return ["language": "en"]
    case .moviesByGenre(let genreId):
      return [
        "page": "1",
        "with_genres": genreId
      ]
    case .nowPlaying:
      return ["page": "1"]
    case .moviesDetails,
        .videos,
        .cast:
      return nil
    }
  }
  
  public var url: String? {
    guard var urlComponents = URLComponents(string: NetworkConfig.baseURL + path) else {
      return nil
    }
    
    if let queryParameters = queryParameters {
      urlComponents.queryItems = queryParameters.map {
        URLQueryItem(name: $0.key, value: $0.value)
      }
    }
    
    return urlComponents.url?.absoluteString
  }
  
  public var method: HTTPMethod {
    switch self {
    case .genre,
        .moviesByGenre,
        .nowPlaying,
        .moviesDetails,
        .videos,
        .cast:
      return .get
    }
  }
  
  public var headers: [String: String] {
    switch self {
    case .genre,
        .moviesByGenre,
        .nowPlaying,
        .moviesDetails,
        .videos,
        .cast:
      return [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOWM2YjhmZTI0NDc0ODQzN2Q1M2M1MGU5NmE2NzhmMiIsIm5iZiI6MTU2MTUzNDA0MS45NTYsInN1YiI6IjVkMTMxZTU5MGUwYTI2MzdjMmNkNmRiZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LiQHRmYV7pMEW04ud6B5oqS4wz_P3qeSpZTM_OrKjDM"
      ]
    }
  }
}
