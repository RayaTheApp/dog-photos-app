//
//  DogPhotosService.swift
//  DogPhotosApp
//
//  Networking service for fetching dog photos.
//  API: https://dog.ceo/api/breeds/image/random/50
//  (Returns random images each time; use count and page for pagination.)
//

import Foundation

enum DogPhotosServiceError: Error {
  case notImplemented
}

protocol DogPhotosServiceProtocol: AnyObject {
  /// Fetch a batch of dog photo URLs.
  /// - Parameters:
  ///   - count: Number of images to request (e.g. 50).
  ///   - page: Page number for pagination (same endpoint, random result per request).
  ///   - completion: Result with array of items or error.
  func fetchPhotos(count: Int, page: Int, completion: @escaping (Result<[DogPhotoItem], Error>) -> Void)
}

final class DogPhotosService: DogPhotosServiceProtocol {
  
  func fetchPhotos(count: Int, page: Int, completion: @escaping (Result<[DogPhotoItem], Error>) -> Void) {
    // TODO: Implement. URL: https://dog.ceo/api/breeds/image/random/{count}
    completion(.failure(DogPhotosServiceError.notImplemented))
  }
}
