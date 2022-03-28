//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 26.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
 
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        //view.layer.cornerRadius = 10
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackTop: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        //stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackBottom: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var photoLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .red
        //label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var arrowImage: UIImageView = {
        let photoView = UIImageView()
        photoView.translatesAutoresizingMaskIntoConstraints = false
        //photoView.backgroundColor = .yellow
        photoView.contentMode = .scaleAspectFit
        //photoView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        photoView.image = UIImage(systemName: "chevron.right")
        
        return photoView
    }()
    
    private lazy var image1: UIImageView = {
        let photoView = UIImageView()
        photoView.translatesAutoresizingMaskIntoConstraints = false
        //photoView.backgroundColor = .yellow
        photoView.contentMode = .scaleAspectFill
        photoView.image = UIImage(named: "Photos/\(Photos.listPhoto[0])")
        photoView.clipsToBounds = true
        
        photoView.layer.cornerRadius = 12
        
        //photoView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        //photoView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        return photoView
    }()
    
    private lazy var image2: UIImageView = {
        let photoView = UIImageView()
        photoView.translatesAutoresizingMaskIntoConstraints = false
        //photoView.backgroundColor = .yellow
        photoView.contentMode = .scaleAspectFill
        photoView.image = UIImage(named: "Photos/\(Photos.listPhoto[1])")
        photoView.clipsToBounds = true
        
        photoView.layer.cornerRadius = 12
        
        //photoView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        //photoView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        return photoView
    }()
    
    private lazy var image3: UIImageView = {
        let photoView = UIImageView()
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.contentMode = .scaleAspectFill
        photoView.image = UIImage(named: "Photos/\(Photos.listPhoto[2])")
        photoView.clipsToBounds = true
        
        photoView.layer.cornerRadius = 12

        return photoView
    }()
    
    private lazy var image4: UIImageView = {
        let photoView = UIImageView()
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.contentMode = .scaleAspectFill
        photoView.image = UIImage(named: "Photos/\(Photos.listPhoto[3])")
        photoView.clipsToBounds = true
        
        photoView.layer.cornerRadius = 12

        return photoView
    }()
    
    private func setupView() {
    
        //self.contentView.backgroundColor = .white
        
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackTop)
        self.backView.addSubview(self.stackBottom)
        
        self.stackTop.addArrangedSubview(self.photoLabel)
        self.stackTop.addArrangedSubview(self.arrowImage)
        
        self.stackBottom.addArrangedSubview(self.image1)
        self.stackBottom.addArrangedSubview(self.image2)
        self.stackBottom.addArrangedSubview(self.image3)
        self.stackBottom.addArrangedSubview(self.image4)
        
        self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
       // self.stackTop.centerYAnchor.constraint(equalTo: self.backView.centerYAnchor).isActive = true
        
        self.stackTop.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 12).isActive = true
        //self.stackTop.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor).isActive = true
        self.stackTop.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16).isActive = true
        self.stackTop.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16).isActive = true
        self.stackTop.bottomAnchor.constraint(equalTo: self.stackTop.bottomAnchor).isActive = true
        
        self.stackBottom.topAnchor.constraint(equalTo: self.stackTop.bottomAnchor, constant: 12).isActive = true
        //self.stackTop.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor).isActive = true
        self.stackBottom.leadingAnchor.constraint(equalTo: self.stackTop.leadingAnchor).isActive = true
        self.stackBottom.trailingAnchor.constraint(equalTo: self.stackTop.trailingAnchor).isActive = true
        self.stackBottom.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -12).isActive = true
        
        self.image1.heightAnchor.constraint(equalTo: self.image1.widthAnchor, multiplier: 0.8).isActive = true
        self.image2.heightAnchor.constraint(equalTo: self.image2.widthAnchor, multiplier: 0.8).isActive = true
        self.image3.heightAnchor.constraint(equalTo: self.image3.widthAnchor, multiplier: 0.8).isActive = true
        self.image4.heightAnchor.constraint(equalTo: self.image4.widthAnchor, multiplier: 0.8).isActive = true
        
        //self.stackBottom.topAnchor.constraint(equalTo: self.stackTop.bottomAnchor, constant: 12).isActive = true
        
        
        //self.stackBottom.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //self.stackBottom.leadingAnchor.constraint(equalTo: self.stackTop.leadingAnchor).isActive = true
        //self.stackBottom.trailingAnchor.constraint(equalTo: self.stackTop.trailingAnchor).isActive = true
        
        //self.arrowImage.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        //self.arrowImage.heightAnchor.constraint(equalTo: self.arrowImage.widthAnchor, multiplier: 0.1).isActive = true
        
        self.photoLabel.text = "Photos"
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
