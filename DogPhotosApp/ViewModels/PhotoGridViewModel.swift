//
//  PhotoGridViewModel.swift
//  DogPhotosApp
//

import Foundation

final class PhotoGridViewModel {
  
  private(set) var items: [DogPhotoItem] = []
  private let service: DogPhotosServiceProtocol
  private var page: Int = 0
  private var isLoadingMore = false
  
  init(service: DogPhotosServiceProtocol = DogPhotosService()) {
    self.service = service
    loadStubItems()
  }
  
  private func loadStubItems() {
    let count = 20
    items = (0..<count).map { i in
      DogPhotoItem(
        id: "stub-\(i)",
        imageURL: URL(string: "https://example.com/placeholder-\(i)")!
      )
    }
  }
  
  func refresh() {
    // intentionally left blank for candidate
  }
  
  func loadMore() {
    page += 1
    
    service.fetchPhotos(count: 50, page: page) { [weak self] result in
      guard let self = self else { return }
      
      switch result {
      case .success(let newItems):
        self.items.append(contentsOf: newItems)
      case .failure:
        break
      }
    }
  }
}
