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
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
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
    
    private lazy var postImage: UIImageView = {
        let photoView = UIImageView()
        photoView.translatesAutoresizingMaskIntoConstraints = false
        //img.image = UIImage(named: img)
        photoView.backgroundColor = .black
        photoView.contentMode = .scaleAspectFit
        photoView.heightAnchor.constraint(equalToConstant: 300).isActive = true
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
        //label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        //label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()
    
    private lazy var likesLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont(name: "Calibri", size: 16)
        label.textColor = .black
        
        //label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        //label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)

        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont(name: "Calibri", size: 16)
        label.textColor = .black
        //label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
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
        self.viewsLabel.text = nil
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.authorLabel)
//        self.backView.addSubview(self.stackView)
        
        self.backView.addSubview(self.postImage)
        self.backView.addSubview(self.descriptionLabel)
        self.backView.addSubview(self.likesLabel)
        self.backView.addSubview(self.viewsLabel)
        
//        self.stackView.addArrangedSubview(self.authorLabel)
//        self.stackView.addArrangedSubview(self.postImage)
//        self.stackView.addArrangedSubview(self.descriptionLabel)
//        self.stackView.addArrangedSubview(self.likesLabel)
//        self.stackView.addArrangedSubview(self.viewsLabel)
        
        let backViewConstraints = self.backViewConstraints()
        let authorConstraints = self.authorConstraints()
        //let stackViewConstraints = self.stackViewConstraints()
        
        let imageConstraint = self.imageConstraint()
        let descriptionConstraints = self.descriptionConstraints()
        let likesConstraints = self.likesConstraints()
        let viewsConstraints = self.viewsConstraints()
        
        NSLayoutConstraint.activate(backViewConstraints
                                    + authorConstraints
                                    + imageConstraint
   //                                 + stackViewConstraints)
                                    + descriptionConstraints
                                    + likesConstraints
                                    + viewsConstraints)
        #warning("Выдает несколько предупреждающих сообщений NSLayoutConstraint, не смог разобраться где и что я не так привязал, подскажите пожалуйста где копать. Еще момент, если нажать на ячейку UITableView то пропадает UITableViewCellSeperatorView")
        
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
        let bottomConstraint = self.authorLabel.bottomAnchor.constraint(equalTo: self.authorLabel.bottomAnchor)
        
        let leadingConstraint = self.authorLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let trailingConstraint = self.authorLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)
        
        //let height = self.authorLabel.heightAnchor.constraint(equalToConstant: 30)
        
        return [topConstraint, leadingConstraint, trailingConstraint, bottomConstraint]
    }
    
    private func stackViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.stackView.topAnchor.constraint(equalTo: self.postImage.bottomAnchor, constant: 12)
        
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        let bottomConstraint = self.stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }
    
    
    private func imageConstraint() -> [NSLayoutConstraint] {
        let topConstraint = self.postImage.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 12)
        let bottomConstraint = self.postImage.bottomAnchor.constraint(equalTo: self.postImage.bottomAnchor)
        let leadingConstraint = self.postImage.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let trailingConstraint = self.postImage.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        
        //let centerX = self.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor)
        //let height = self.heightAnchor.constraint(equalToConstant: 50)
        //let width = self.widthAnchor.constraint(equalToConstant: 50)
        
        let imageViewAspectRatio = self.postImage.heightAnchor.constraint(equalTo: self.postImage.widthAnchor, multiplier: 0.7)
        
        return [topConstraint, bottomConstraint, leadingConstraint, trailingConstraint, imageViewAspectRatio]
    }
    
    private func descriptionConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.descriptionLabel.topAnchor.constraint(equalTo: self.postImage.bottomAnchor, constant: 16)
        let bottomConstraint = self.descriptionLabel.bottomAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor)
        let leadingConstraint = self.descriptionLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let trailingConstraint = self.descriptionLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)
        
        return [topConstraint, bottomConstraint, leadingConstraint, trailingConstraint]
    }
    
    private func likesConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.likesLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16)
        let bottomConstraint = self.likesLabel.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -16)
        let leadingConstraint = self.likesLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        //let trailingConstraint = self.likesLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        
        return [topConstraint, bottomConstraint, leadingConstraint]
    }
    
    private func viewsConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.viewsLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16)
        let bottomConstraint = self.viewsLabel.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -16)
        //let leadingConstraint = self.viewsLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let trailingConstraint = self.viewsLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)
        
        return [topConstraint, bottomConstraint, trailingConstraint]
    }
    
    func setup(with viewModel: ViewModel) {
        guard let viewModel = viewModel as? ViewModel else { return }
        
        self.authorLabel.text = viewModel.author
        self.descriptionLabel.text = viewModel.description
        self.postImage = self.getImage(img: viewModel.image)
        self.likesLabel.text = "Likes: \(viewModel.likes)"
        self.viewsLabel.text = "Views: \(viewModel.views)"
        
    }
}
