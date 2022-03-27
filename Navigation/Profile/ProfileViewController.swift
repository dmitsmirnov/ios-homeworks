//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 21.02.2022.
//

import UIKit


class ProfileViewController: UIViewController {
    
    //private var delegate = ProfileHeaderView()
    
    var isHeaderViewExpanded: Bool = false {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        //tableView.estimatedSectionHeaderHeight = 0
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.backgroundColor = .white
        tableView.backgroundColor = .systemGray6
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosCell")
        
        return tableView
    }()
    
    private lazy var layoutCollection: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: self.layoutCollection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private var dataSource: [Post.Article] = []
    
    var heightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.tableView.reloadData()
        
        let post1 = Post.Article(author: "eminem", description: News.eminem, image: "eminemPhoto.jpg", likes: 10, views: 217)
        let post2 = Post.Article(author: "basta", description: News.basta, image: "bastaPhoto.jpeg", likes: 5, views: 140)
        
        let article = [post1, post2]
        self.dataSource = article
        
        // hidden keyboard
        self.view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tap)))
        //print(self.isHeaderViewExpanded)
    }

    @objc func tap() {
        self.view.endEditing(true)
    }
    
    private func setupView() {
        
        self.view.backgroundColor = .white
        
        //self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.tableView)
        //self.tableView.addSubview(self.profileHeaderView)
//        let topConstraintView = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
//        let leadingConstraintView = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
//        let trailingConstraintView = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
//        let bottomConstraintView = self.profileHeaderView.bottomAnchor.constraint(equalTo: self.profileHeaderView.bottomAnchor)
//        //let heightConstraintView = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        self.heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 200)
        
        // вернуть
        //let topConstraintTable = self.tableView.topAnchor.constraint(equalTo: self.profileHeaderView.bottomAnchor, constant: 10)
//        let topConstraintTable = self.tableView.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 10)
//        let leadingConstraintTable = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
//        let trailingConstraintTable = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
//        let bottomConstraintTable = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        let topConstraintTable = self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraintTable = self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraintTable = self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        let bottomConstraintTable = self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        //self.tableView.beginUpdates()
        //self.tableView.endUpdates()
        
        NSLayoutConstraint.activate([
            //topConstraintView,
            //leadingConstraintView,
            //trailingConstraintView,
            self.heightConstraint,
            //bottomConstraintView,
            //вернуть
            topConstraintTable,
            leadingConstraintTable,
            trailingConstraintTable,
            bottomConstraintTable
        ].compactMap({ $0 }))
        
        //print(delegate.statusTextField.isHidden)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        //let profileHeaderView = ProfileHeaderView()
        //profileHeaderView.delegate = self
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource, ProfileHeaderViewProtocol {
    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        //view.backgroundColor = .red
//        let p = ProfileHeaderView()
//        view.addSubview(p)
//        view.layoutIfNeeded()
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return 1
//        } else {
            return self.dataSource.count + 1
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //print(indexPath.row)
        
        //if indexPath.section == 0 {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell", for: indexPath) as! PhotosTableViewCell
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? PostTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            
            let article = self.dataSource[indexPath.row - 1]
            let viewModel = PostTableViewCell.ViewModel(author: article.author,
                                                        description: article.description,
                                                        image: article.image,
                                                        likes: article.likes,
                                                        views: article.views)
            //tableView.numberOfSections
            cell.setup(with: viewModel)
            return cell
        }
        
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 200
//        }
//        //return nil
//    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath)
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //print(delegate.statusTextField.isHidden)
        return self.isHeaderViewExpanded ? 244 : 200
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let profile = ProfileHeaderView()
        return profile
    }
    
    //func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //    tableView.tableHeaderView = UIView(frame: .zero)
    //}
    
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {
        self.heightConstraint?.constant = textFieldIsVisible ? 244 : 200
        
        //self.tableView.reloadData()
        
        UIView.animate(withDuration: 0.3, delay: 0.0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
    
}

extension ProfileViewController: ProfileViewControllerDelegate {
    func myTest() {
        //self.isHeaderViewExpanded = false
        print("123")
    }
}
