//
//  SceneDelegate.swift
//  zhihuzhye-swift
//
//  Created by 张梦云 on 2020/4/1.
//  Copyright © 2020 winfree. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//        guard let _ = (scene as? UIWindowScene) else { return }
        
        
        if let windowScene = scene as? UIWindowScene{
            
            
            let window = UIWindow(windowScene: windowScene)
            
            let mainTabBarVc = MainTabBarController(viewControllers: self.viewControllers(), tabBarItemsAttributes: self.tabBarItemsAttributesForController())
            
            window.rootViewController = mainTabBarVc
            self.window = window
            
            mainTabBarVc.hideTabBadgeBackgroundSeparator();
        
            window.makeKeyAndVisible()
            UITabBar.appearance().backgroundColor = UIColor.white
        }
   
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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


    
    
    func viewControllers() -> [UINavigationController]{
          let home = UINavigationController(rootViewController: HomeViewController())
          let connection = UINavigationController(rootViewController: MeViewController())
          let message = UINavigationController(rootViewController: MessageViewController())
          let personal =   UINavigationController(rootViewController: PersonalViewController())
          let viewControllers = [home, connection, message, personal]
          
          return viewControllers
          
      }
      

      func tabBarItemsAttributesForController() ->  [[String : String]] {
          
          let tabBarItemOne = [CYLTabBarItemTitle:"首页",
                               CYLTabBarItemImage:"home_normal",
                               CYLTabBarItemSelectedImage:"home_highlight"]
          
          let tabBarItemTwo = [CYLTabBarItemTitle:"同城",
                               CYLTabBarItemImage:"mycity_normal",
                               CYLTabBarItemSelectedImage:"mycity_highlight"]
          
          let tabBarItemThree = [CYLTabBarItemTitle:"消息",
                                 CYLTabBarItemImage:"message_normal",
                                 CYLTabBarItemSelectedImage:"message_highlight"]
          
          let tabBarItemFour = [CYLTabBarItemTitle:"我的",
                                CYLTabBarItemImage:"account_normal",
                                CYLTabBarItemSelectedImage:"account_highlight"]
          let tabBarItemsAttributes = [tabBarItemOne,tabBarItemTwo,tabBarItemThree,tabBarItemFour]
          return tabBarItemsAttributes
      }

}

