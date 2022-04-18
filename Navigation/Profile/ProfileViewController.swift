//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 21.02.2022.
//

import UIKit
import AudioToolbox


class ProfileViewController: UIViewController {
    
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
    
    private lazy var zoomView: ZoomPostView = {
        let view = ZoomPostView()
        //view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .systemGray6
        return view
    }()
    
    private lazy var myView: UIView = {
        let view = UIView()
        //view.delegate = self
        view.isHidden = true
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
        tableView.estimatedSectionHeaderHeight = 0
        tableView.isUserInteractionEnabled = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.backgroundColor = .white
        tableView.backgroundColor = .systemGray6
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosCell")
        
        //tableView.collisionBoundingPath.lineWidth = 0.2
        //tableView.accessibilityPath?.lineWidth =
        return tableView
    }()
    
    private var dataSource: [Post.Article] = []
    
    var heightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.tableView.reloadData()
        
        let post1 = Post.Article(author: "snoop dog", description: News.snoopDog, image: "SnoopDog.jpg", likes: 12, views: 217)
        let post2 = Post.Article(author: "eminem", description: News.eminem, image: "eminemPhoto.jpg", likes: 10, views: 110)
        let post3 = Post.Article(author: "britney spears", description: News.britneySpears, image: "BritneySpears.jpeg", likes: 17, views: 164)
        let post4 = Post.Article(author: "linkin park", description: News.linkinPark, image: "LP.jpg", likes: 21, views: 138)
        let post5 = Post.Article(author: "basta", description: News.basta, image: "bastaPhoto.jpeg", likes: 7, views: 140)
        
        
        let article = [post1, post2, post3, post4, post5]
        self.dataSource = article
        
        // hidden keyboard
        // если активировать этот метод, то не срабатывает метод tableView - didSelectAtRow
        //self.view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tap)))
        //print(self.isHeaderViewExpanded)
        
    }
    
    @objc func tap() {
        self.view.endEditing(true)
    }
    
    private func setupView() {
        
        self.view.backgroundColor = .white

        self.view.addSubview(self.tableView)
        self.heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 200)
        
        // вернуть
//        let topConstraintTable = self.tableView.topAnchor.constraint(equalTo: self.profileHeaderView.bottomAnchor, constant: 10)
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
        self.view.addSubview(self.zoomView)
        self.zoomView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.zoomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.zoomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.zoomView.bottomAnchor.constraint(equalTo: self.tableView.bottomAnchor).isActive = true
        
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
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        //let profileHeaderView = ProfileHeaderView()
        //profileHeaderView.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource, ProfileHeaderViewProtocol {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return 1
//        } else {
            return self.dataSource.count + 1
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
            
            cell.setup(with: viewModel)
            
            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressCell(sender:)))
            
            longPress.minimumPressDuration = 0.7
            cell.addGestureRecognizer(longPress)
            
            return cell
        }
        
    }
    
    @objc private func longPressCell(sender: UILongPressGestureRecognizer) {
        
        if sender.state == .began {
            //let pressIndexPath = self.tableView.indexPathForRow(at: sender.location(in: self.tableView))
            //let pressCell = self.tableView.cellForRow(at: pressIndexPath!)
            //let cell = pressCell as! PostTableViewCell
            
            // vibrate
            //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            AudioServicesPlaySystemSound(1519)
            //AudioServicesPlaySystemSound(1520)
            //AudioServicesPlaySystemSound(1521)
            //UIImageWriteToSavedPhotosAlbum(cell.postImage.image!, self, #selector(saveCompleted), nil)
        }
        
    }
    
    @objc func saveCompleted() {
        print("save finished")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row > 0 {
            return 500
        }
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.isHeaderViewExpanded ? 244 : 200
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let profile = ProfileHeaderView()
        return profile
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            let photoViewController = PhotosViewController()
            
            let navigationController = UINavigationController(rootViewController: photoViewController)
            navigationController.modalPresentationStyle = .fullScreen
            
            let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goToBackView))
            photoViewController.navigationItem.leftBarButtonItem = backButton
            
            #warning("Через push не отображается navigationController, скорее всего я думаю это т.к. в root controller установлены 2 контроллера - LoginViewController и FeedViewController, а ProfileViewController отсутсвует. Пробовал менять в SceneDelegate LoginViewController на ProfileViewController, но тогда главной страницей при запуске приложения становиться ProfileViewController. Также пробовал добавлять - navigationController.viewControllers = [loginViewController, profileViewController], тоже получается ерунда. Вообщем экран пушиться, но без navigationController. Поэтому я его презентовал, а кнопку назад добавил, костыль, но работает) И в следствии всего это естественно отсутствует TabBar")
            //self.navigationController?.pushViewController(photoViewController, animated: true)
            self.present(navigationController, animated: true)
        } else {

            self.zoomView.isHidden = false
            
            var article = self.dataSource[indexPath.row - 1]
            self.zoomView.setupView(text: article.description, image: article.image)
            article.views += 1
            
            self.dataSource[indexPath.row - 1] = article
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
            //self.tableView.reloadData()
            
            UIView.animate(withDuration: 0.3) {
                self.zoomView.alpha = 1
                self.view.layoutIfNeeded()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row > 0 {
            return true
        } else {
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.dataSource.remove(at: indexPath.row - 1)
            //self.tableView.reloadRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
        }
    }
    
    @objc func goToBackView() {
        self.dismiss(animated: true)
    }
    
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

