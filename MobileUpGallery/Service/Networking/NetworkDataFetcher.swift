//
//  NetworkDataFetcher.swift
//  MobileUpGallery
//
//  Created by Alexander Morozkov on 08.08.2021.
//

import Foundation

protocol DataFetcher {
    func getPhotos(response: @escaping (PhotosResponse?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {

    let networking: Networking
    init(networking: Networking) {
        self.networking = networking
    }

    func getPhotos(response: @escaping (PhotosResponse?) -> Void) {
        let params = ["owner_id": API.owner_id, "album_id": API.album_id]
        networking.request(path: API.photos, params: params) { data, error in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
            let decoded = self.decodeJSON(type: PhotosResponseWrapped.self, from: data)
            response(decoded?.response)
        }
    }

    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else {
            return nil }
        return response
    }
}
