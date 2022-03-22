//
//  SecondViewController.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 16.02.2022.
//

import UIKit

struct Post {
    var title: String
}

class FeedViewController: UIViewController {

    //@IBOutlet weak var showPostButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Лента"
        //self.showPostButton.layer.cornerRadius = 12
        
        self.view.addSubview(self.buttonsStackView)
        self.buttonsStackView.addArrangedSubview(self.action1Button)
        self.buttonsStackView.addArrangedSubview(self.action2Button)
        
        let horizons = self.buttonsStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let vertical = self.buttonsStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        let weightConstraint = self.buttonsStackView.widthAnchor.constraint(equalToConstant: 150)
        
        NSLayoutConstraint.activate([horizons, vertical, weightConstraint])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let someText = Post(title: "Some text")
        
        guard segue.identifier == "seguePost",
                let seguePost = segue.destination as? PostViewController
        else { return }
        
        seguePost.customText = someText.title
        
    }
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var action1Button: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button 1", for: .normal)
        button.layer.cornerRadius = 12
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.red.cgColor
        
        button.addTarget(self, action: #selector(goToFeed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var action2Button: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button 2", for: .normal)
        button.layer.cornerRadius = 12
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.red.cgColor
        
        button.addTarget(self, action: #selector(goToFeed), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func goToFeed() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.view.backgroundColor = .white
        
        //let plusImage = UIImage(named: "edit")!
        //let plusButton = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: "")
        let infoBarButton = UIBarButtonItem(title: "info", style: .plain, target: self, action: #selector(goToInfo))
        
        postViewController.navigationItem.rightBarButtonItem = infoBarButton
        
    }
    
    @objc private func goToInfo() {
        
    }
}
