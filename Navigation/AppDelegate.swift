//
//  AppDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let coordinator = AppCoordinator()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator.navigator
        window?.makeKeyAndVisible()
        
        UIApplication.shared.setMinimumBackgroundFetchInterval(
          UIApplication.backgroundFetchIntervalMinimum)
        
        NetworkService.dataTask(config: .planets) { string in
            if let result = string {
                print("result: \(result)")
            }
        }
        
        NetworkService.dataTaskRequest(httpMethod: .get, config: .people) { string in
            if let result = string {
                print("result request: \(result)")
            }
        }
        
        return true
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

        if let navController = window?.rootViewController as? UINavigationController {
            let viewController = navController.viewControllers[0] as! MyTabBarController
            
            viewController.fetch {
                viewController.updateUI()
                  completionHandler(.newData)
            }
        }
    }
}

