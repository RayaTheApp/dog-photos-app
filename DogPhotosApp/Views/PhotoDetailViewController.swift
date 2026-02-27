//
//  PhotoDetailViewController.swift
//  DogPhotosApp
//

import UIKit

final class PhotoDetailViewController: UIViewController {
  
  private let item: DogPhotoItem
  private let imageLoader: ImageLoaderProtocol?
  
  private let imageView: UIImageView = {
    let v = UIImageView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.contentMode = .scaleAspectFit
    v.backgroundColor = .systemGray4
    v.clipsToBounds = true
    return v
  }()
  
  init(item: DogPhotoItem, imageLoader: ImageLoaderProtocol? = ImageLoader()) {
    self.item = item
    self.imageLoader = imageLoader
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    view.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
    loadImage()
  }
  
  private func loadImage() {
    imageLoader?.loadImage(url: item.imageURL) { [weak self] image in
      self?.imageView.image = image
    }
  }
}
