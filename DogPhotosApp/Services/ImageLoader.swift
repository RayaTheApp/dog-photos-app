//
//  ImageLoader.swift
//  DogPhotosApp
//
//  Load images from URLs with caching and request cancellation.
//  Implement this type so that:
//  - In-flight requests for the same URL are coalesced or cancelled as needed.
//  - Loaded images are cached (e.g. in-memory) to avoid redundant network calls.
//  - Callers can cancel a load (e.g. when a cell is reused).
//

import UIKit

/// Token returned from loadImage; use it to cancel the request when no longer needed.
protocol ImageLoadCancellable {
  func cancel()
}

/// Loads an image from a URL. Implement caching and cancellation.
protocol ImageLoaderProtocol: AnyObject {
  /// Load an image for the given URL.
  /// - Parameters:
  ///   - url: Image URL.
  ///   - completion: Called on main queue with image or nil (e.g. on failure or cancel).
  /// - Returns: A cancellable token. Call cancel() when the load is no longer needed (e.g. cell reuse).
  @discardableResult
  func loadImage(url: URL, completion: @escaping (UIImage?) -> Void) -> ImageLoadCancellable
}

final class ImageLoader: ImageLoaderProtocol {
  
  func loadImage(url: URL, completion: @escaping (UIImage?) -> Void) -> ImageLoadCancellable {
    // For now, call completion with nil so cells can show a placeholder.
    DispatchQueue.main.async { completion(nil) }
    return NoOpCancellable()
  }
}

private final class NoOpCancellable: ImageLoadCancellable {
  func cancel() {}
}
