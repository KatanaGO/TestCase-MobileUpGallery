//
//  WebImageView.swift
//  MobileUpGallery
//
//  Created by Alexander Morozkov on 08.08.2021.
//

import Foundation
import UIKit

class WebImageView: UIImageView {
    
    func setImageUrl(imageURL: String) {
        
        guard let url = URL(string: imageURL) else { return }
        
        if let cacheResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cacheResponse.data)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data, let response = response {
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                    self?.handleLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    
    private func handleLoadedImage(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cacheResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cacheResponse, for: URLRequest(url: responseURL))
    }
}
