//
//  GithubService.swift
//  Crane
//
//  Created by captain on 2020/7/28.
//  Copyright © 2020 captain. All rights reserved.
//

import Foundation


struct Repo: Decodable, Identifiable {
    var id: Int
    let name: String
    let description: String
}

struct SearchResponse: Decodable {
    let items: [Repo]
}

class GithubService {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
    
    func search(matching query: String, handler: @escaping( Result<[Repo], Error>) -> Void) {
        guard var urlComponents = URLComponents(string: "https://github.com/search") else {
            preconditionFailure("Can't create url components...")
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: query)
        ]
        guard let url = urlComponents.url else {
            preconditionFailure("Can't create url from url components...")
        }
        
        session.dataTask(with: url) {[weak self] data, _, error in
            if let error = error {
                handler(.failure(error))
            }else {
                handler(.success([]))
//                do {
//                    let data = data ?? Data()
//                    let response = try self?.decoder.decode(SearchResponse.self, from: data)
//                    handler(.success(response?.items ?? []))
//                }catch {
//                    handler(.failure(error))
//                }
            }
        }.resume()
    }
}
