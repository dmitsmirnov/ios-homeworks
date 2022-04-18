//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 16.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    struct ViewModel {
        var author: String
        var description: String
        var image: String
        var likes: Int
        var views: Int
    }
    
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
    
    private lazy var stackForLikesAndViews: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        //stackView.distribution = .fillEqually
        //stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        //label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    lazy var postImage: UIImageView = {
        let photoView = UIImageView()
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.backgroundColor = .black
        photoView.contentMode = .scaleAspectFit
        //photoView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        //photoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(presentFullScreen)))
        //photoView.isUserInteractionEnabled = true
        return photoView
    }()
    
    func getImage(img: String) -> UIImageView {
        self.postImage.image = UIImage(named: img)
        return self.postImage
    }
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = UIFont(name: "Calibri", size: 16)
        //label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        //label.setContentHuggingPriority(UILayoutPriority(100), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()
    
    //private let tapLikeGestureRecognizer = UITapGestureRecognizer()
    
    lazy var likesLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont(name: "Calibri", size: 16)
        label.textColor = .black
        label.tag = 123
        label.isUserInteractionEnabled = true
        
        //label.widthAnchor.constraint(equalToConstant: 25).isActive = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLike)))
        
        return label
    }()
    
    lazy var likesCountLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont(name: "Calibri", size: 16)
        label.textColor = .black
        label.tag = 123
        label.isUserInteractionEnabled = true
        
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLike)))
        
        return label
    }()
    
    private func setupGestureRecognizer() {
        //self.tapLikeGestureRecognizer.addTarget(self, action: #selector(self.tapLike(_:)))
        //self.likesCountLabel.addGestureRecognizer(self.tapLikeGestureRecognizer)
        //self.likesLabel.addGestureRecognizer(self.tapLikeGestureRecognizer)
    }

    @objc func tapLike(_ gestureRecognizer: UITapGestureRecognizer) {
        //print("tap")
       let numberLikes = Int(self.likesCountLabel.text!)
       self.likesCountLabel.text = String(numberLikes!+1)
    }
    
    @objc func presentFullScreen() {
        //print("123")
    }
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont(name: "Calibri", size: 16)
        label.textColor = .black
        //label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        //self.setupGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.authorLabel.text = nil
        self.descriptionLabel.text = nil
        self.postImage.image = nil
        self.likesLabel.text = nil
        self.likesCountLabel.text = nil
        self.viewsLabel.text = nil
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.authorLabel)
        
        self.backView.addSubview(self.postImage)
        self.backView.addSubview(self.descriptionLabel)
        
        self.backView.addSubview(self.stackForLikesAndViews)
        self.stackForLikesAndViews.addArrangedSubview(self.likesLabel)
        self.stackForLikesAndViews.addArrangedSubview(self.likesCountLabel)
        self.stackForLikesAndViews.addArrangedSubview(self.viewsLabel)
        
        let backViewConstraints = self.backViewConstraints()
        let authorConstraints = self.authorConstraints()
        
        let imageConstraint = self.imageConstraint()
        let descriptionConstraints = self.descriptionConstraints()
        let stackLikesAndViewsConstraint = self.stackLikesAndViewsConstraint()
        
        NSLayoutConstraint.activate(backViewConstraints
                                    + authorConstraints
                                    + imageConstraint
                                    + descriptionConstraints
                                    + stackLikesAndViewsConstraint)
        
        self.likesLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.likesCountLabel.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
    
    private func backViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        
        return [topConstraint, bottomConstraint, leadingConstraint, trailingConstraint]
    }
   
    private func authorConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.authorLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 12)
        let leadingConstraint = self.authorLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let trailingConstraint = self.authorLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)
        
        return [topConstraint, leadingConstraint, trailingConstraint]
    }
    
    private func imageConstraint() -> [NSLayoutConstraint] {
        let topConstraint = self.postImage.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 12)
        let leadingConstraint = self.postImage.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let trailingConstraint = self.postImage.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        let imageViewAspectRatio = self.postImage.heightAnchor.constraint(equalTo: self.postImage.widthAnchor, multiplier: 0.7)
        
        return [topConstraint, leadingConstraint, trailingConstraint, imageViewAspectRatio]
    }
    
    private func descriptionConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.descriptionLabel.topAnchor.constraint(equalTo: self.postImage.bottomAnchor, constant: 16)
        let leadingConstraint = self.descriptionLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let trailingConstraint = self.descriptionLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)
        
        return [topConstraint, leadingConstraint, trailingConstraint]
    }
    
    private func stackLikesAndViewsConstraint() -> [NSLayoutConstraint] {
        let topConstraint = self.stackForLikesAndViews.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16)
        let bottomConstraint = self.stackForLikesAndViews.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -16)
        let leadingConstraint = self.stackForLikesAndViews.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let trailingConstraint = self.stackForLikesAndViews.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)
        
        return [topConstraint, bottomConstraint, leadingConstraint, trailingConstraint]
    }
    
    func setup(with viewModel: ViewModel) {
        guard let viewModel = viewModel as? ViewModel else { return }
        
        self.authorLabel.text = viewModel.author
        self.descriptionLabel.text = viewModel.description
        self.postImage = self.getImage(img: viewModel.image)
        self.likesLabel.text = "Likes: "
        self.likesCountLabel.text = String(viewModel.likes)
        self.viewsLabel.text = "Views: \(viewModel.views)"
        
    }
}
