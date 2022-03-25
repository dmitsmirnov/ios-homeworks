//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 21.02.2022.
//

import UIKit


class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    private var statusText: String = ""
    private var buttonTopConstraint: NSLayoutConstraint?
    
    weak var delegate: ProfileHeaderViewProtocol?
    //weak var delegate: ProfileViewControllerDelegate?
    //weak var delegateProfileHeaderView = ProfileViewController()
    
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
       
        button.addTarget(self, action: #selector(self.didTapStatusButton), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        //label.backgroundColor = .red
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont(name: "", size: 14)
        //label.backgroundColor = .green
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
    
    lazy var statusTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.font = UIFont(name: "", size: 15)
        textField.textColor = .black
        textField.isHidden = true
        textField.tag = 100
        
        textField.delegate = self
        
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.indent(size: 10)
        //textField.backgroundColor = .yellow
        
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
        self.statusTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawSelf() {
            
        self.backgroundColor = .systemGray6
        
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
        
        self.buttonTopConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 16)
        self.buttonTopConstraint?.priority = UILayoutPriority(rawValue: 999)
        let leadingButtonConstraint = self.setStatusButton.leadingAnchor.constraint(equalTo: self.infoStackView.leadingAnchor)
        let trailingButtonConstraint = self.setStatusButton.trailingAnchor.constraint(equalTo: self.infoStackView.trailingAnchor)
        let bottomButtonConstraint = self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let heightButtonConstraint = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint,
            imageViewAspectRatio,
            self.buttonTopConstraint, leadingButtonConstraint,
            trailingButtonConstraint, bottomButtonConstraint, heightButtonConstraint
        ].compactMap({ $0 }))

    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        //self.drawSelf()
        
        self.avatarImageView.layoutIfNeeded()
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
       
        //self.delegate?.updateTable()
        // вариант №2
        //DispatchQueue.main.async {
        //    self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
        //}
    }
    
    @objc private func didTapStatusButton() {
        
        if self.statusTextField.isHidden {
            self.addSubview(self.statusTextField)
            
            self.buttonTopConstraint?.isActive = false
            
            let topConstraint = self.statusTextField.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 10)
            let leadingConstraint = self.statusTextField.leadingAnchor.constraint(equalTo: self.infoStackView.leadingAnchor)
            let trailingConstraint = self.statusTextField.trailingAnchor.constraint(equalTo: self.infoStackView.trailingAnchor)
            let heightTextFieldConstraint = self.statusTextField.heightAnchor.constraint(equalToConstant: 34)
            self.buttonTopConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.statusTextField.bottomAnchor, constant: 16)
            
            NSLayoutConstraint.activate([
                topConstraint, leadingConstraint, trailingConstraint, heightTextFieldConstraint, self.buttonTopConstraint
            ].compactMap({ $0 }))
            
        } else {
            if let viewWithTag = self.viewWithTag(100) {
                viewWithTag.removeFromSuperview()
                self.buttonTopConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 16)
                NSLayoutConstraint.activate([self.buttonTopConstraint].compactMap({ $0 }))
            }
        }
        
        
        UIView.animate(withDuration: 0.3, delay: 0.0) {
            self.statusTextField.isHidden.toggle()
            self.layoutIfNeeded()
            self.layoutSubviews()
        }
        
        //print(self.delegate?.isHeaderViewExpanded)
        self.delegate?.isHeaderViewExpanded.toggle()
        
        //self.delegate?.updateTable()
//        self.delegate?.didTapStatusButton(textFieldIsVisible: self.statusTextField.isHidden) { [ weak self ] in
//            self?.statusTextField.isHidden.toggle()
//            //self.layoutIfNeeded()
//            //self.layoutSubviews()
//            //self.isHeaderViewExpanded = self?.statusTextField.isHidden
//        }
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
    
    @objc private func buttonPressed() {
        if (self.statusTextField.isHidden != false) && (statusText != "") {
            self.statusLabel.text = statusText
        }
        self.endEditing(true)
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text!
    }
}


