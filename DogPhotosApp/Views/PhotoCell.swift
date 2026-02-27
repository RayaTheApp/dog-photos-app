//
//  PhotoCell.swift
//  DogPhotosApp
//

import UIKit

final class PhotoCell: UICollectionViewCell {
  
  static let reuseID = "PhotoCell"
  private let imageView = UIImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    contentView.backgroundColor = .systemGray3
    contentView.layer.cornerRadius = 8
    contentView.clipsToBounds = true
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    contentView.addSubview(imageView)
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
  }
  
  func configure(with item: DogPhotoItem, imageLoader: ImageLoaderProtocol?) {
    _ = imageLoader?.loadImage(url: item.imageURL) { [weak self] image in
      self?.imageView.image = image
    }
  }
}
