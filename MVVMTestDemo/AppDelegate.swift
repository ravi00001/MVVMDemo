
//  AppDelegate.swift
//  MVVMTestDemo
//  Created by Ravi Parsa on 03/09/19.
//  Copyright © 2019 Ravi Parsa. All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        JCConfigEndPoints.shared.initialize()

        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
     
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    
}

