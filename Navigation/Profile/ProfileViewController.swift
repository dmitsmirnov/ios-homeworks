//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 21.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let phv: ProfileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        
        self.view.addSubview(phv)
        phv.frame = super.view.frame
        
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        phv.frame = super.view.frame
    }
    
}
