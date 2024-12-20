//
//  NetworkService.swift
//  Shared
//
//  Created by M. Rizki Maulana on 20/12/24.
//

import UIKit

public class NetworkService: NetworkServiceProtocol {
  public func request<T: Decodable>(
    endpoint: NetworkEndpoints,
    completion: @escaping (Result<T, any Error>) -> Void
  ) {
    guard let urlString = endpoint.url, let url = URL(string: urlString) else {
      completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
      return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = endpoint.method.rawValue
    
    endpoint.headers.forEach { key, value in
      request.setValue(value, forHTTPHeaderField: key)
    }
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      if let error {
        completion(.failure(error))
        return
      }
      
      guard let data else {
        completion(.failure(NSError(domain: "No data", code: 400, userInfo: nil)))
        return
      }
      
      do {
        let decodeResponse = try JSONDecoder().decode(T.self, from: data)
        completion(.success(decodeResponse))
      } catch {
        completion(.failure(error))
      }
    }
    task.resume()
  }
}
