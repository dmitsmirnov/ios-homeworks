//
//  LoginInViewController.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 10.03.2022.
//

import UIKit

class LoginInViewController: UIViewController, UITextFieldDelegate {
    
    var buttonTopConstrains: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        loginTextField.delegate = self
        passwordTextField.delegate = self
        self.configureSubview()
    
        // hidden keyboard
        self.view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tap)))
    }
    
    @objc func tap() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
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
        
        self.scrollView.addSubview(self.attentionLabel)
        
        let scrollTop = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollBottom = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let scrollLeft = self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let scrollRight = self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
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
        
        self.mainStack.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 16).isActive = true
        self.mainStack.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -16).isActive = true
        self.mainStack.topAnchor.constraint(equalTo: self.logo.bottomAnchor, constant: 120).isActive = true
        self.mainStack.heightAnchor.constraint(equalToConstant: 100).isActive = true

        self.logInButton.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 16).isActive = true
        self.logInButton.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -16).isActive = true

        self.buttonTopConstrains = self.logInButton.topAnchor.constraint(equalTo: self.mainStack.bottomAnchor, constant: 16)
        self.buttonTopConstrains?.priority = UILayoutPriority(rawValue: 999)
        
        self.logInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        NSLayoutConstraint.activate([scrollTop,
                                     scrollBottom,
                                     scrollLeft,
                                     scrollRight,
                                     self.buttonTopConstrains].compactMap({ $0 }))
        
        //self.attentionLabel.isHidden = true

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
        
        //textField.delegate = self
        
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
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        
        button.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var animation: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.06
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 8, y: view.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 8, y: view.center.y))
        return animation
    }()
    
    private lazy var attentionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.alpha = 0
        label.text = "not enough symbols"
        label.textColor = .red
        label.tag = 100
        
        return label
    }()
    
    @objc private func goToProfile() {
        
        if loginTextField.text?.count == 0 {
            
            mainStack.layer.borderColor = UIColor.red.cgColor
            view.layer.add(self.animation, forKey: "position")
            
        } else if passwordTextField.text?.count == 0 {
            
            mainStack.layer.borderColor = UIColor.red.cgColor
            view.layer.add(self.animation, forKey: "position")
            
        } else {
            
            if passwordTextField.text!.count < 3 {
                
                //self.scrollView.addSubview(self.attentionLabel)
                
                let animationTop = self.attentionLabel.topAnchor.constraint(equalTo: self.mainStack.bottomAnchor, constant: 5)
                let animationCenter = self.attentionLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
                
                self.buttonTopConstrains?.isActive = false
                self.buttonTopConstrains = self.logInButton.topAnchor.constraint(equalTo: self.attentionLabel.bottomAnchor, constant: 10)
                
                NSLayoutConstraint.activate([animationTop, animationCenter, self.buttonTopConstrains].compactMap({ $0 }))
                
                self.attentionLabel.isHidden = false
                self.attentionLabel.alpha = 1
                
            } else {
                
                if isValidEmail(email: loginTextField.text!) {
                    
                    if checkEmailAndPassword(emailText: loginTextField.text!,
                                             password: passwordTextField.text!) {
                        
                        let profileView = ProfileViewController()
                        self.show(profileView, sender: .none)
                        //self.present(profileView, animated: true)
                        mainStack.layer.borderColor = UIColor.lightGray.cgColor
                        //attentionLabel.isHidden = true
                        attentionLabel.alpha = 0
                        
                        if let viewWithTag = self.view.viewWithTag(100) {
                            viewWithTag.removeFromSuperview()
                            self.buttonTopConstrains = self.logInButton.topAnchor.constraint(equalTo: self.mainStack.bottomAnchor, constant: 16)
                            NSLayoutConstraint.activate([self.buttonTopConstrains].compactMap({ $0 }))
                            
                        }
                    } else {
                        let alert = UIAlertController(title: "Attention", message: "Email or password don't correct, try again", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true)
                    }
                } else {
                    //print("email isn't valid")
                    let animationTop = self.attentionLabel.topAnchor.constraint(equalTo: self.mainStack.bottomAnchor, constant: 5)
                    let animationCenter = self.attentionLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
                    
                    self.buttonTopConstrains?.isActive = false
                    self.buttonTopConstrains = self.logInButton.topAnchor.constraint(equalTo: self.attentionLabel.bottomAnchor, constant: 10)
                    
                    NSLayoutConstraint.activate([animationTop, animationCenter, self.buttonTopConstrains].compactMap({ $0 }))
                    
                    self.attentionLabel.text = "email isn't valid"
                    self.attentionLabel.isHidden = false
                    self.attentionLabel.alpha = 1
                    view.layer.add(self.animation, forKey: "position")
                    
                }
            }
            
           UIView.animate(withDuration: 0.5) {
               
               self.scrollView.layoutIfNeeded()
               self.scrollView.layoutSubviews()
               
            }
            
        }
        
    }
    
    private func checkEmailAndPassword(emailText: String, password: String) -> Bool {
        
        let enterPassword = ListEmails.emailsAndPasswords[emailText]
        guard let x = enterPassword
            
        else {
            return false
        }
        
        if x == password {
            return true
        } else {
            return false
        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
