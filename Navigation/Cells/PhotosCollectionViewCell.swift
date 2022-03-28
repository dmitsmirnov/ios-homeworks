//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 28.03.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
 
    struct ViewModel {
        var title: String
    }
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        //view.layer.cornerRadius = 10
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        //view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        
        image.contentMode = .scaleAspectFill
        
        //image.image = UIImage(named: "Photos/1.jpg")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private func setupView() {
        self.contentView.addSubview(self.backView)
        
        self.backView.addSubview(self.imageView)
        
        let topAnchor = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let bottomAnchor = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        let leadingAnchor = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingAnchor = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        
        let topAnchorImage = self.imageView.topAnchor.constraint(equalTo: self.backView.topAnchor)
        let bottomAnchorImage = self.imageView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)
        let leadingAnchorImage = self.imageView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let trailingAnchorImage = self.imageView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        
        //let imageViewAspectRatio = self.imageView.heightAnchor.constraint(equalTo: self.imageView.widthAnchor, multiplier: 0.2)
        
        NSLayoutConstraint.activate([topAnchor,
                                     bottomAnchor,
                                     leadingAnchor,
                                     trailingAnchor,
                                     topAnchorImage,
                                     bottomAnchorImage,
                                     leadingAnchorImage,
                                     trailingAnchorImage])
                                     //imageViewAspectRatio])
        
    }
    
    
    func setup(with viewModel: ViewModel){
        self.imageView.image = UIImage(named: "Photos/\(viewModel.title)")
    }
    
    func setup(_ imageString: String) {
        self.imageView.image = UIImage(named: "Photos/\(imageString)")
    }
    
}
