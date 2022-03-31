//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 07.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
       // guard let _ = (scene as? UIWindowScene) else { return }
        
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowsScene)
        self.window?.rootViewController = createTabBarController()
        //UITabBar.appearance().barTintColor = .red
        //let loginIn = LoginInViewController()
        //self.window?.rootViewController?.show(loginIn, sender: .none)
        self.window?.makeKeyAndVisible()
        
    }

    func createProfileViewController() -> UINavigationController {
        
        let loginViewController = LoginInViewController()
        //let profileViewController = ProfileViewController()
        //let photosViewController = PhotosViewController()
        
        let navigationController = UINavigationController()
        
        //let profileViewController = ProfileViewController()
        loginViewController.title = "Profile"
        loginViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 0)
       
        navigationController.viewControllers = [loginViewController]
        
        return navigationController
        //return UINavigationController(rootViewController: loginViewController)
        
    }
    
    func createFeedViewController() -> UINavigationController {
        
        let feedViewController = FeedViewController()
        feedViewController.title = "Feed"
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "doc.richtext"), tag: 0)
    
        return UINavigationController(rootViewController: feedViewController)
        
    }
    
    func createAvatarViewController() -> UINavigationController {
        
        let avatarViewController = AvatarViewController()
        avatarViewController.title = "Avatar"
        avatarViewController.tabBarItem = UITabBarItem(title: "Avatar", image: UIImage(systemName: "person"), tag: 0)
    
        return UINavigationController(rootViewController: avatarViewController)
        
    }
    
//    func createTestViewController() -> UINavigationController {
//
//        let testViewController = PhotosViewController()
//        //feedViewController.title = "Feed"
//        //feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "doc.richtext"), tag: 0)
//
//        return UINavigationController(rootViewController: testViewController)
//
//    }
    
    func createTabBarController() -> UITabBarController {
        
        let tabBarController = TabBarController()
        tabBarController.viewControllers = [createProfileViewController(),
                                            createFeedViewController(),
                                            createAvatarViewController()]
        
        return tabBarController
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

