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
    
    private lazy var photoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        //image.isHidden = true
        //image.alpha = 0
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var zoomPhotoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.alpha = 0
        view.backgroundColor = .clear
        //view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideView)))
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panHideView)))
        return view
    }()
    
    private lazy var blurEffect: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.zoomPhotoView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    
    @objc private func hideView() {
        
        UIView.animate(withDuration: 0.3) {
            self.zoomPhotoView.alpha = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func panHideView(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            UIView.animate(withDuration: 0.3) {
                self.zoomPhotoView.alpha = 0
                self.view.layoutIfNeeded()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.setupView()
    }
    
    func setupView() {
        
        self.view.addSubview(self.collection)
        self.view.addSubview(self.zoomPhotoView)
        
        self.zoomPhotoView.addSubview(self.blurEffect)
        self.zoomPhotoView.addSubview(self.photoImage)
        
        
        let topConstraint =  self.collection.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8)
        let bottomConstraint =  self.collection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let leadingConstraint =  self.collection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8)
        let trailingConstraint =  self.collection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8)
        
        NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
        
        //self.zoomPhotoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //self.zoomPhotoView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        //self.zoomPhotoView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        //self.zoomPhotoView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.zoomPhotoView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.zoomPhotoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.zoomPhotoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.zoomPhotoView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.photoImage.centerXAnchor.constraint(equalTo: self.zoomPhotoView.centerXAnchor).isActive = true
        self.photoImage.centerYAnchor.constraint(equalTo: self.zoomPhotoView.centerYAnchor).isActive = true
        self.photoImage.leadingAnchor.constraint(equalTo: self.zoomPhotoView.leadingAnchor).isActive = true
        self.photoImage.trailingAnchor.constraint(equalTo: self.zoomPhotoView.trailingAnchor).isActive = true
        //self.photoImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        //self.photoImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("123")
        //Photos.listPhoto[indexPath.row]
        self.photoImage.image = UIImage(named: Photos.listPhoto[indexPath.row])
        
        self.zoomPhotoView.isHidden = false
        
        UIView.animate(withDuration: 0.3) {
            //self.zoomPhotoView.alpha = 0.97
            self.zoomPhotoView.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
}
