//
//  AuthViewController.swift
//  MobileUpGallery
//
//  Created by Alexander Morozkov on 04.08.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authService = AppDelegate.shared().authService
    }
    
    @IBAction func signInTouch() {
        authService.wakeUpSession()
    }
    
}
