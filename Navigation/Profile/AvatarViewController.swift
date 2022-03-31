//
//  AvatarViewController.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 31.03.2022.
//

import UIKit

class AvatarViewController: UIViewController {

    private lazy var myView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .green
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.image = UIImage(named: "myPhoto.jpeg")
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.gray.cgColor
        image.layer.borderWidth = 3
        
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    private lazy var closeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .red
        view.alpha = 0
        return view
    }()
    
    private lazy var closeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "clear")
        //image.backgroundColor = .clear
        return image
    }()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    private let tapGestureRecognizerClose = UITapGestureRecognizer()
    
    private var isExpanded: Bool = false
    
    var heightView: NSLayoutConstraint?
    var widthView: NSLayoutConstraint?
    
    var centerX: NSLayoutConstraint?
    var centerY: NSLayoutConstraint?
    
    var trailingView: NSLayoutConstraint?
    var topView: NSLayoutConstraint?
    
    private func setupView() {
    
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.myView)
        self.view.addSubview(self.closeView)
        
        self.myView.addSubview(self.avatarImageView)
        self.closeView.addSubview(self.closeImageView)
        //self.closeView.bringSubviewToFront(self.closeImageView)
        
        self.topView = self.myView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)
        self.trailingView = self.myView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        
        self.heightView = self.myView.heightAnchor.constraint(equalToConstant: 150)
        self.widthView = self.myView.widthAnchor.constraint(equalToConstant: 150)
        
        //let imageViewAspectRatio = self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 0.5)
        
        let bottomCloseView = self.closeView.bottomAnchor.constraint(equalTo: self.myView.topAnchor, constant: -20)
        let trailingCloseView = self.closeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        let heightCloseView = self.closeView.heightAnchor.constraint(equalToConstant: 25)
        let widthCloseView = self.closeView.widthAnchor.constraint(equalToConstant: 25)
        
        let topCloseImage = self.closeImageView.topAnchor.constraint(equalTo: self.closeView.topAnchor)
        let leadingCloseImage = self.closeImageView.leadingAnchor.constraint(equalTo: self.closeView.leadingAnchor)
        let bottomCloseImage = self.closeImageView.bottomAnchor.constraint(equalTo: self.closeView.bottomAnchor)
        let trailingCloseImage = self.closeImageView.trailingAnchor.constraint(equalTo: self.closeView.trailingAnchor)
        
        
        let topImage = self.avatarImageView.topAnchor.constraint(equalTo: self.myView.topAnchor)
        let trailingImage = self.avatarImageView.trailingAnchor.constraint(equalTo: self.myView.trailingAnchor)
        let bottomImage = self.avatarImageView.bottomAnchor.constraint(equalTo: self.myView.bottomAnchor)
        let leadingImage = self.avatarImageView.leadingAnchor.constraint(equalTo: self.myView.leadingAnchor)
        
        self.centerX = self.myView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.centerY = self.myView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        self.topView?.isActive = true
        self.trailingView?.isActive = true
        
        self.centerX?.isActive = false
        self.centerY?.isActive = false
        
        NSLayoutConstraint.activate([topImage, trailingImage, bottomImage, leadingImage,
                                     
                                     bottomCloseView, trailingCloseView, heightCloseView, widthCloseView,
                                     topCloseImage, leadingCloseImage, bottomCloseImage, trailingCloseImage,
                                     
                                     self.heightView,
                                     self.widthView].compactMap({ $0 }))
        
        
        self.avatarImageView.layoutIfNeeded()
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
        
    }
    
    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(zoomImage(_:)))
        self.myView.addGestureRecognizer(self.tapGestureRecognizer)
        
        self.tapGestureRecognizerClose.addTarget(self, action: #selector(returnPositionView(_:)))
        self.closeView.addGestureRecognizer(self.tapGestureRecognizerClose)
    }
    
    @objc func zoomImage(_ gesture: UITapGestureRecognizer) {
        
        guard self.tapGestureRecognizer === gesture else { return }
        self.isExpanded.toggle()
            
        if isExpanded {
            self.changeAttributes()
            
            UIView.animate(withDuration: 0.5) {
                
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
                self.avatarImageView.layer.cornerRadius = 0
                
            } completion: {_ in
                
                UIView.animate(withDuration: 0.3) {
                    self.closeView.alpha = 1
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    @objc func returnPositionView(_ gesture: UITapGestureRecognizer) {
        
        guard self.tapGestureRecognizerClose === gesture else { return }
        self.isExpanded.toggle()
        
        if !isExpanded {
            self.changeAttributes()
            
            self.closeView.alpha = 0
            
            UIView.animate(withDuration: 0.5) {
                
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor.white.withAlphaComponent(1)
                self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
                
            } completion: {_ in
                
            }
        }
    }
    
    private func changeAttributes() {
    
        self.widthView?.constant = self.isExpanded ? self.view.frame.width : 150
        self.heightView?.constant = self.isExpanded ? self.view.frame.width : 150
        
        self.topView?.isActive = !self.isExpanded
        self.trailingView?.isActive = !self.isExpanded
        self.centerX?.isActive = self.isExpanded
        self.centerY?.isActive = self.isExpanded
        
        self.avatarImageView.layer.borderWidth = self.isExpanded ? 0 : 3
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        self.setupView()
        
        self.setupGesture()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
