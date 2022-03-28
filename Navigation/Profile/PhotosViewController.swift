//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 28.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private enum CountCell {
        static let item: CGFloat = 3
    }
    
    private lazy var layoutCollection: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: self.layoutCollection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        //collection.backgroundColor = .red
        
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCell")
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.setupView()
        
    }
    
    func setupView() {
        self.view.addSubview(self.collection)
        
        let topConstraint =  self.collection.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8)
        let bottomConstraint =  self.collection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let leadingConstraint =  self.collection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8)
        let trailingConstraint =  self.collection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8)
        
        NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
    }
    
    func setSizeForCell(for width: CGFloat, with spacing: CGFloat) -> CGSize{
    
        let sizeNeeded = width - 2 * spacing
        let sizeItem = floor(sizeNeeded / CountCell.item)
        
        return CGSize(width: sizeItem, height: sizeItem)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        //self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Photo Gallery"
        self.navigationItem.backButtonTitle = "Назад"

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

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Photos.listPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath) as! PhotosCollectionViewCell
        
        let viewModel = PhotosCollectionViewCell.ViewModel(title: Photos.listPhoto[indexPath.row])
        cell.setup(with: viewModel)
        //cell.setup(Photos.listPhoto[indexPath.row])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.setSizeForCell(for: collectionView.frame.width, with: spacing ?? 0)
        
    }
    
}
