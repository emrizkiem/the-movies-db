//
//  Casts.swift
//  Shared
//
//  Created by M. Rizki Maulana on 20/12/24.
//

import Foundation

public struct Casts: Decodable {
  public let cast: [CastItem]
  public let id: Int
  public let crew: [CrewItem]
}

public struct CastItem: Decodable {
  public let castId: Int
  public let character: String
  public let gender: Int
  public let creditId: String
  public let knownForDepartment: String
  public let originalName: String
  public let popularity: Double
  public let name: String
  public let profilePath: String
  public let id: Int
  public let adult: Bool
  public let order: Int
}

public struct CrewItem: Decodable {
  public let department: String
  public let gender: Int
  public let creditId: String
  public let knownForDepartment: String
  public let originalName: String
  public let popularity: Double
  public let name: String
  public let profilePath: String
  public let id: Int
  public let adult: Bool
  public let job: String
}
