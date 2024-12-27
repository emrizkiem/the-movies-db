//
//  NetworkService.swift
//  Shared
//
//  Created by M. Rizki Maulana on 20/12/24.
//

import UIKit
import Combine

public class NetworkService: NetworkServiceProtocol {
  public init() {}
  
  public func request<T: Decodable>(endpoint: NetworkEndpoints) -> AnyPublisher<T, Error> {
    guard let urlString = endpoint.url,
          let url = URL(string: urlString) else {
      return Fail(
        error: NSError(
          domain: "Invalid URL",
          code: 400,
          userInfo: nil
        )
      ).eraseToAnyPublisher()
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = endpoint.method.rawValue
    endpoint.headers.forEach { key, value in
      request.setValue(value, forHTTPHeaderField: key)
    }
    
    return URLSession.shared.dataTaskPublisher(for: request)
      .tryMap { output in
        guard let httpResponse = output.response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
          throw URLError(.badServerResponse)
        }
        return output.data
      }
      .decode(type: T.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}
