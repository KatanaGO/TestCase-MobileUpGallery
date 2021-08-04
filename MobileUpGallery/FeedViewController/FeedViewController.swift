//
//  FeedViewController.swift
//  MobileUpGallery
//
//  Created by Alexander Morozkov on 04.08.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.5671284795, green: 0.7945078611, blue: 0.9987251163, alpha: 1)
            networkService.getFeed()
    }
}
