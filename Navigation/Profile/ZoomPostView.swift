//
//  ZoomPostView.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 11.04.2022.
//

import UIKit

class ZoomPostView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        //scrollView.alpha = 0.92
        scrollView.layer.cornerRadius = 12
        
        return scrollView
    }()
    
    private lazy var postImage: UIImageView = {
        let photoView = UIImageView()
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.backgroundColor = .black
        photoView.contentMode = .scaleAspectFit
        photoView.clipsToBounds = true

        //photoView.isUserInteractionEnabled = true
        return photoView
    }()
    
    private lazy var closeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "multiply.circle")
        image.isUserInteractionEnabled = true
        image.tintColor = .white
        image.heightAnchor.constraint(equalToConstant: 25).isActive = true
        image.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideZoomPost)))
        
        return image
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        //label.text = "Hipster Cat"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        //label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 100
        //label.isHighlighted = true
        label.font = UIFont.systemFont(ofSize: 18)
        //label.backgroundColor = .red
        return label
    }()
    
    private lazy var blurEffect: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    
    @objc func hideZoomPost() {
        
        UIView.animate(withDuration: 0.3) {
            self.alpha = 0
            self.layoutIfNeeded()
        } completion: { _ in
            self.isHidden = true
        }
        
    }
    
    private func drawSelf() {
        
        self.backgroundColor = .clear
        self.isHidden = true
        self.alpha = 0
        
        //self.layer.cornerRadius = 12
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.blurEffect)
        
        self.addSubview(self.scrollView)
        
        self.scrollView.addSubview(self.closeImage)
        self.scrollView.addSubview(self.postImage)
        self.scrollView.addSubview(self.textLabel)
        
        self.scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        
        //self.closeImage.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 15).isActive = true
        self.closeImage.trailingAnchor.constraint(equalTo: self.postImage.trailingAnchor).isActive = true
        self.closeImage.bottomAnchor.constraint(equalTo: self.postImage.topAnchor, constant: -10).isActive = true
        
        self.postImage.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 50).isActive = true
        self.postImage.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        //self.postImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        self.postImage.widthAnchor.constraint(equalToConstant: 350).isActive = true
        self.postImage.heightAnchor.constraint(equalTo: self.postImage.widthAnchor, multiplier: 0.7).isActive = true
        
        self.textLabel.leadingAnchor.constraint(equalTo: self.postImage.leadingAnchor).isActive = true
        self.textLabel.trailingAnchor.constraint(equalTo: self.postImage.trailingAnchor).isActive = true
       
        self.textLabel.topAnchor.constraint(equalTo: self.postImage.bottomAnchor, constant: 5).isActive = true
        
        self.textLabel.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -5).isActive = true
        
    }
    
    func setupView(text: String, image: String){
        self.textLabel.text = text
        self.postImage.image = UIImage(named: image)
    }
    
}
