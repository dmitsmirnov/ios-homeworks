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
        
        self.addSubview(self.image)
        self.image.topAnchor.constraint(equalTo: self.topAnchor, constant: 57).isActive = true
        self.image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        self.image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.image.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.image.layer.cornerRadius = self.image.bounds.size.width / 2
    
        self.addSubview(self.button)
        self.button.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 30).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(self.label1)
        self.label1.topAnchor.constraint(equalTo: self.topAnchor, constant: 67).isActive = true
        self.label1.leadingAnchor.constraint(equalTo: self.image.trailingAnchor, constant: 16).isActive = true
        self.label1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        self.label1.textAlignment = .left
        
        self.addSubview(self.label2)
        self.label2.bottomAnchor.constraint(equalTo: self.image.bottomAnchor, constant: -40).isActive = true
        self.label2.leadingAnchor.constraint(equalTo: self.image.trailingAnchor, constant: 16).isActive = true
        self.label2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        self.label2.textAlignment = .left
        
        self.addSubview(self.textField)
        self.textField.topAnchor.constraint(equalTo: self.label2.bottomAnchor, constant: 15).isActive = true
        self.textField.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: -15).isActive = true
        
        self.textField.leadingAnchor.constraint(equalTo: self.image.trailingAnchor, constant: 16).isActive = true
        self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        self.textField.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
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
    
    private lazy var label1: UILabel = {
        let label1 = UILabel()
        label1.text = "Hipster Cat"
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.textColor = .black
        label1.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        return label1
    }()
    
    private lazy var label2: UILabel = {
        let label2 = UILabel()
        label2.text = "Waiting for something..."
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.textColor = .gray
        label2.font = UIFont(name: "", size: 14)
        
        return label2
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.image = UIImage(named: "myPhoto.jpeg")
        image.clipsToBounds = true
        
        return image
    }()
    
    private lazy var textField: UITextField = {
        
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.font = UIFont(name: "", size: 15)
        textField.textColor = .black
        
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return textField
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
    
    @objc private func buttonPressed() {
        print(self.label1.text!)
        self.label2.text = statusText
        self.endEditing(true)
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text!
    }
    
//    @IBAction func hideKeyBoardButton(_ sender: Any) {
//    self.view.endEditing(true)
//
//    }
    
}

