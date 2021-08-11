//
//  PhotosResponse.swift
//  MobileUpGallery
//
//  Created by Alexander Morozkov on 08.08.2021.
//

import Foundation

struct PhotosResponseWrapped: Decodable {
    let response: PhotosResponse
}

struct PhotosResponse: Decodable {
    let items: [PhotosItem]
}

struct PhotosItem: Decodable {
    let date: Double
    let id: Int
    let sizes: [PhotosUrl]
}

struct PhotosUrl: Decodable {
    let url: String
}

struct PhotoViewModel {
    struct Cell: PhotoCellViewModel {
        var photoUrlString: String
        var date: Double
    }
    var cells: [Cell]
}
