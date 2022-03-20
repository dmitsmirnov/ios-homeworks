//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 21.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        
        return tableView
    }()
    
    private var dataSource: [Post.Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        let post1 = Post.Article(author: "eminem", description: News.eminem, image: "eminemPhoto.jpg", likes: 10, views: 217)
        let post2 = Post.Article(author: "basta", description: News.basta, image: "bastaPhoto.jpeg", likes: 5, views: 140)
        
        let article = [post1, post2]
        self.dataSource = article
        self.tableView.reloadData()
    }

    private func setupView() {
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.tableView)
        
        let topConstraintView = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraintView = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraintView = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        let bottomConstraintView = self.profileHeaderView.bottomAnchor.constraint(equalTo: self.profileHeaderView.bottomAnchor)
        let heightConstraintView = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        
        let topConstraintTable = self.tableView.topAnchor.constraint(equalTo: self.profileHeaderView.bottomAnchor)
        let leadingConstraintTable = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraintTable = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraintTable = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        //let centerXAnchorTable = self.tableView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        //let heightConstraintTable = self.tableView.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([
            topConstraintView,
            leadingConstraintView,
            trailingConstraintView,
            heightConstraintView,
            bottomConstraintView,
            
            topConstraintTable,
            leadingConstraintTable,
            trailingConstraintTable,
            //centerXAnchorTable,
            //heightConstraintTable,
            bottomConstraintTable
        ].compactMap({ $0 }))
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        let article = self.dataSource[indexPath.row]
        let viewModel = PostTableViewCell.ViewModel(author: article.author,
                                                    description: article.description,
                                                    image: article.image,
                                                    likes: article.likes,
                                                    views: article.views)
        cell.setup(with: viewModel)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400
//    }
    
}
