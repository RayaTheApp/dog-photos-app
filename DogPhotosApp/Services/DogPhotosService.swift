//
//  DogPhotosService.swift
//  DogPhotosApp
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
    completion(.failure(DogPhotosServiceError.notImplemented))
  }
}
