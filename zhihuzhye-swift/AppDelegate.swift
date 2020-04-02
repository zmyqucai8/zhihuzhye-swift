//
//  AppDelegate.swift
//  zhihuzhye-swift
//
//  Created by 张梦云 on 2020/4/1.
//  Copyright © 2020 winfree. All rights reserved.
//

import UIKit
 
 

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

 
    var window: UIWindow?
    var viewController: UIViewController?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
          
            
        return true
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
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

