

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Create UI elements
    
    //Create ScrollViewCell
    let scrollViewCell: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    
    //Create ImageView
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .top
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        scrollViewCell.contentSize = CGSize(width: contentView.frame.width, height: contentView.frame.height + 100)
        
        contentView.addSubview(scrollViewCell)
        scrollViewCell.addSubview(imageView)
        
        setupImageView()
        setupScrollVieCell()
    }
    
    //MARK: - Setup UI elements
    
    private func setupScrollVieCell() {
        scrollViewCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10).isActive = true
        scrollViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setupImageView() {
        imageView.topAnchor.constraint(equalTo: scrollViewCell.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: scrollViewCell.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: scrollViewCell.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: scrollViewCell.bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    func setupImage(from photo: Photo) {
        
        DispatchQueue.global().async {
            guard let url = photo.urls?.regular else { return }
            guard let imageUrl = URL(string: url) else { return }
            DispatchQueue.main.async {
                self.imageView.kf.setImage(with: imageUrl)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
