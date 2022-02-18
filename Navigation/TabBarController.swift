//
//  TabBarController.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 16.02.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.viewControllers?.enumerated().forEach({(index, viewController) in
//            switch index {
//            case 0:
//                viewController.tabBarItem.title = "Профиль"
//            case 1:
//                viewController.tabBarItem.title = "Лента"
//            default:
//                viewController.tabBarItem.title = ""
//            }
//        } )
        
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = UIImage(systemName: "star")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.selectedImage = UIImage(systemName: "star.fill")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.title = "Профиль"
        //myTabBarItem1.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
        myTabBarItem2.image = UIImage(systemName: "book")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem2.selectedImage = UIImage(systemName: "book.fill")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem2.title = "Лента"
        //myTabBarItem2.imageInsets = UIEdgeInsets(top: 6, left: 10, bottom: -6, right: 10)
        
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
