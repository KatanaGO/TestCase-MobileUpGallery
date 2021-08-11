//
//  AuthViewController.swift
//  MobileUpGallery
//
//  Created by Alexander Morozkov on 08.08.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = AppDelegate.shared().authService
        button.layer.cornerRadius = 15
        
    }
    
    @IBAction func signInTouch() {
        authService.wakeUpSession()
    }
    
}
