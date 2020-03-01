//
//  AppDelegate.swift
//  Workmate
//
//  Created by Gaurang Patel on 01/03/20.
//  Copyright © 2020 Workmate. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Authenticate User from server
        self.authenticateUser()
        
        return true
    }

    // MARK: - authenticateUser Method

    func authenticateUser() {
        
        let webServices = WebServices()
        
        webServices.authenticateUser(params: Constants.userDict, completion: { (response, error) in

            if (error != nil) {
                
                //Error
            }
            else {
                
                //API Success
                
                if (response != nil) {
                    
                    let key = response!["key"] as? String ?? ""
                    
                    if (key != "") {
                        
                        Constants.keychain_setObject(key as AnyObject, forKey: Constants.authKey)
                    }
                    else {
                        
                        //Error
                        //This field is required.
                    }
                }
            }
        })
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

