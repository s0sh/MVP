//
//  NetworkingService.swift
//  MVP
//
//  Created by Roman Bigun on 02.03.2021.
//

import Foundation

protocol NetworkingServiceProtocol {
    func apiToGetCommentsData(completion : @escaping (Result<[Comment]?, Error>) -> Void)
}

class NetworkingService :  NetworkingServiceProtocol {
    private let sourcesURLString = "https://jsonplaceholder.typicode.com/comments"
    
    func apiToGetCommentsData(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        guard let url = URL(string: sourcesURLString) else { return }
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let error = error {
                completion(.failure(error))
                return// Somehow it doesnt return from the function when completion block fires
            }
            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
