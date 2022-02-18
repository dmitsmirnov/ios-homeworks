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

    @IBOutlet weak var showPostButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Лента"
        self.showPostButton.layer.cornerRadius = 12
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let someText = Post(title: "Some text")
        
        guard segue.identifier == "seguePost",
                let seguePost = segue.destination as? PostViewController
        else { return }
        
        seguePost.customText = someText.title
       
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
