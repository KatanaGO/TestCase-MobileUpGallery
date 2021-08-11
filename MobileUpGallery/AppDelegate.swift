//
//  AppDelegate.swift
//  MobileUpGallery
//
//  Created by Alexander Morozkov on 04.08.2021.
//

import UIKit
import VKSdkFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AuthServiceDelegate {
          
    var window: UIWindow?
    var authService: AuthService!
    static func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions lauchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        self.authService = AuthService()
        authService.delegate = self
        
        //let authVC: AuthViewController = AuthViewController.loadFromStoryboard()
        let authVC = AuthViewController(nibName: "AuthViewController", bundle: nil)
        
        window?.rootViewController = authVC
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
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
    
    // MARK: AuthServiceDelegate
    
    func authServiceShouldShow(_ viewController: UIViewController) {
        print(#function)
        window?.rootViewController?.present(viewController, animated: true, completion: nil)
    }
    
    func authServiceSignIn() {
        print(#function)
        //let galleryVC: GalleryViewController = GalleryViewController.loadFromStoryboard()
        let galleryVC = GalleryViewController(nibName: "GalleryViewController", bundle: nil)
        let navVC = UINavigationController(rootViewController: galleryVC)
        window?.rootViewController = navVC
    }
    
    func authServiceDidSignInFali() {
        print(#function)
    }
    
    func authServiceSignOut() {
        //let authVC: AuthViewController = AuthViewController.loadFromStoryboard()
        let authVC = AuthViewController(nibName: "AuthViewController", bundle: nil)
        let navVC = UINavigationController(rootViewController: authVC)
        window?.rootViewController = navVC
        print(#function)
    }
    
}
