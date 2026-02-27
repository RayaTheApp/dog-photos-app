//
//  PhotoGridViewController.swift
//  DogPhotosApp
//

import UIKit

final class PhotoGridViewController: UIViewController {
  
  private let viewModel: PhotoGridViewModel
  private let imageLoader: ImageLoaderProtocol
  
  private var collectionView: UICollectionView!
  private lazy var layout: UICollectionViewFlowLayout = {
    let l = UICollectionViewFlowLayout()
    l.minimumInteritemSpacing = 8
    l.minimumLineSpacing = 8
    l.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    return l
  }()
  
  init(viewModel: PhotoGridViewModel = PhotoGridViewModel(), imageLoader: ImageLoaderProtocol = ImageLoader()) {
    self.viewModel = viewModel
    self.imageLoader = imageLoader
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Dog Photos"
    view.backgroundColor = .systemBackground
    setupCollectionView()
    setupLongPress()
  }
  
  private func setupCollectionView() {
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .systemBackground
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseID)
    view.addSubview(collectionView)
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
  
  private func setupLongPress() {
    let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
    collectionView.addGestureRecognizer(longPress)
  }
  
  @objc private func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
    // TODO: Complete long-press preview: show photo fullscreen while pressed, dismiss on release.
    switch gesture.state {
    case .began:
      break // Stub: show preview
    case .ended, .cancelled:
      break // Stub: dismiss preview
    default:
      break
    }
  }
}

extension PhotoGridViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseID, for: indexPath) as! PhotoCell
    let item = viewModel.items[indexPath.item]
    cell.configure(with: item, imageLoader: imageLoader)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let padding: CGFloat = 8 * 3 // left + right + spacing
    let available = max(100, collectionView.bounds.width - padding)
    let width = available / 2
    return CGSize(width: width, height: width)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let item = viewModel.items[indexPath.item]
    let detail = PhotoDetailViewController(item: item, imageLoader: imageLoader)
    navigationController?.pushViewController(detail, animated: true)
  }
}
