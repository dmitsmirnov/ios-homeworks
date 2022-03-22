//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 21.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String = ""
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.backgroundColor = .white
        
        self.addSubview(self.infoStackView)
        self.addSubview(self.setStatusButton)
        
        self.addSubview(self.statusTextField)
        
        self.infoStackView.addArrangedSubview(self.avatarImageView)
        self.infoStackView.addArrangedSubview(self.labelsStackView)
        
        self.labelsStackView.addArrangedSubview(self.fullNameLabel)
        self.labelsStackView.addArrangedSubview(self.statusLabel)
        
        let topConstraint = self.infoStackView.topAnchor.constraint(equalTo: self.topAnchor)
        let leadingConstraint = self.infoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingConstraint = self.infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        let imageViewAspectRatio = self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0)
        
        let topTextFieldConstraint = self.statusTextField.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 10)
        let leadingTextFieldConstraint = self.statusTextField.leadingAnchor.constraint(equalTo: self.labelsStackView.leadingAnchor)
        let trailingTextFieldConstraint = self.statusTextField.trailingAnchor.constraint(equalTo: self.infoStackView.trailingAnchor)
        let heightTextFieldConstraint = self.statusTextField.heightAnchor.constraint(equalToConstant: 30)
        
        let topButtonConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.statusTextField.bottomAnchor, constant: 10)
        let leadingButtonConstraint = self.setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingButtonConstraint = self.setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16)
        let bottomButtonConstraint = self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let heightButtonConstraint = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        
        // self.avatarImageView.layer.cornerRadius =  self.avatarImageView.frame.height / 2
        //self.avatarImageView.layer.cornerRadius = 60
        
        NSLayoutConstraint.activate([
            topConstraint,
            leadingConstraint,
            trailingConstraint,
            imageViewAspectRatio,
            
            topTextFieldConstraint,
            leadingTextFieldConstraint,
            trailingTextFieldConstraint,
            heightTextFieldConstraint,
            
            topButtonConstraint,
            leadingButtonConstraint,
            trailingButtonConstraint,
            bottomButtonConstraint,
            heightButtonConstraint
        ].compactMap({ $0 }))
        
        // скругление картинки вариант№1
        // пересчитать фрейм картинки принудительно
        self.avatarImageView.layoutIfNeeded()
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
        
        // скругление картинки вариант№2
        // рассчитать только позиции находящиеся в стеке
        //DispatchQueue.main.async {
        //    self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
        //}
    }
     
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("set status...", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.black.cgColor
       
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont(name: "", size: 14)
        
        return label
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.image = UIImage(named: "myPhoto.jpeg")
        image.clipsToBounds = true
        
        return image
    }()
    
        private lazy var statusTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.font = UIFont(name: "", size: 15)
        textField.textColor = .black
        textField.indent(size:10)
        
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return textField
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
    
    @objc private func buttonPressed() {
        print(self.fullNameLabel.text!)
        self.statusLabel.text = statusText
        self.endEditing(true)
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text!
    }
    
}


