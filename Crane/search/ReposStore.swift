//
//  ReposStore.swift
//  Crane
//
//  Created by captain on 2020/7/28.
//  Copyright © 2020 captain. All rights reserved.
//

import Foundation
import Combine

final class ReposStore: ObservableObject {
    @Published private(set) var repos: [Repo] = []
    
    private let service: GithubService
    init(service: GithubService) {
        self.service = service
    }
    
    func fetch(matching query: String) {
        service.search(matching: query) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case.success(let repos):
//                    self?.repos = repos
                    self?.repos.append(Repo(id: self?.repos.count ?? 0, name: "repos\(self?.repos.count)", description: "repo \(self?.repos.count) desc"))
                case .failure: self?.repos = []
                }
            }
        }
    }
}
