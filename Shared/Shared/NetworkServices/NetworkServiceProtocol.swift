//
//  NetworkServiceProtocol.swift
//  Shared
//
//  Created by M. Rizki Maulana on 20/12/24.
//

import UIKit

public protocol NetworkServiceProtocol {
  func request<T: Decodable>(
    endpoint: NetworkEndpoints,
    completion: @escaping (Result<T, Error>) -> Void
  )
}

public enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
  case put = "PUT"
  case delete = "DELETE"
}