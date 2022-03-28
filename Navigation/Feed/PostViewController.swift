//
//  PostViewController.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 16.02.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var customText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = customText
        
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
