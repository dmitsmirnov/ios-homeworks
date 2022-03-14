//
//  LoginInViewController.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 10.03.2022.
//

import UIKit


class LoginInViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
        self.configureSubview()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    private func configureSubview() {
        
        //self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.addSubview(self.scrollView)
        
        self.scrollView.addSubview(self.mainView)
        
        self.mainView.addSubview(self.logo)
        self.mainView.addSubview(self.mainStack)
        self.mainView.addSubview(self.logInButton)
        
        self.mainStack.addArrangedSubview(self.loginTextField)
        self.mainStack.addArrangedSubview(self.passwordTextField)
        
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.mainView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.mainView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        self.mainView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.mainView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.mainView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        self.mainView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        
        self.logo.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 100).isActive = true
        self.logo.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        self.logo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.logo.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.logo.bottomAnchor.constraint(equalTo: self.logo.bottomAnchor).isActive = true
        
        self.mainStack.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 16).isActive = true
        self.mainStack.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -16).isActive = true
        self.mainStack.topAnchor.constraint(equalTo: self.logo.bottomAnchor, constant: 120).isActive = true
        self.mainStack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.mainStack.bottomAnchor.constraint(equalTo: self.mainStack.bottomAnchor).isActive = true
        
        self.logInButton.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 16).isActive = true
        self.logInButton.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -16).isActive = true
        self.logInButton.topAnchor.constraint(equalTo: self.mainStack.bottomAnchor, constant: 16).isActive = true
        self.logInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    private lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.backgroundColor = .white
        
        return mainView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        
        return scrollView
    }()
    
    private lazy var logo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "logo.png"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        return logo
    }()
    
    private lazy var mainStack: UIStackView = {
        let mainStack = UIStackView()
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.backgroundColor = .systemGray6
        mainStack.axis = .vertical
        mainStack.alignment = .leading
        mainStack.layer.borderColor = UIColor.lightGray.cgColor
        mainStack.layer.borderWidth = 0.5
        mainStack.layer.cornerRadius = 10
        
        // равномерное распределение
        mainStack.distribution = .fillEqually
        mainStack.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        mainStack.isLayoutMarginsRelativeArrangement = true
        
        // отступ
        //mainStack.spacing = 10
        #warning("Не удалось реализовать разделительную полоску между двумя textField")
        
        mainStack.backgroundColor = .systemGray6
        return mainStack
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .clear
        textField.autocorrectionType = .no
        textField.placeholder = "Email or phone"
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .clear
        textField.autocorrectionType = .no
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        
        button.addTarget(self, action: #selector(self.goToProfile), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func goToProfile() {
        let profileView = ProfileViewController()
        self.show(profileView, sender: .none)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        //self.view.endEditing(true)
        self.scrollView.endEditing(true)
        #warning("Перестала скрываться клавиатура при нажатии на любую часть экрана")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {

//        let kbFrameSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
//        if self.scrollView.frame.origin.y == 0 {
//            self.scrollView.frame.origin.y -= kbFrameSize!.height
//        }
        #warning("Не смог разобраться как получить высоту клавиатуры, которая может перекрывать элементы, а может и не перекрывать")
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        
    }

    @objc func keyboardWillHide(notification: NSNotification) {
//      if self.scrollView.frame.origin.y != 0 {
//          self.scrollView.frame.origin.y = 0
//      }
        scrollView.contentOffset = CGPoint(x: 0, y: -47)

    }
    
}
