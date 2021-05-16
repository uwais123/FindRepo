//
//  HomeInteractor.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation
import Combine

protocol HomeProvider {
    func searchRepos(query: String) -> AnyPublisher<[Repo], Error>
}

final class HomeInteractor: NSObject {
    
    typealias RepoInstance = (RemoteDataSource) -> HomeInteractor
    
    fileprivate let remote: RemoteDataSource
    
    private init(remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: RepoInstance = { remoteRepo in
        return HomeInteractor(remote: remoteRepo)
    }
}

extension HomeInteractor: HomeProvider {
    
    func searchRepos(query: String) -> AnyPublisher<[Repo], Error> {
        return self.remote.searchRepos(query: query)
            .map { RepoMapper.mapRepoResponseToEntities(input: $0) }
            .eraseToAnyPublisher()
    }
    
}

