//
//  Genres.swift
//  Shared
//
//  Created by M. Rizki Maulana on 20/12/24.
//

import Foundation

public struct Genres: Decodable {
  public let genres: [GenreItem]
  
  public struct GenreItem: Decodable {
    public let id: Int
    public let name: String
  }
}


