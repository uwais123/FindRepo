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
    
    func getVisitedRepo() -> AnyPublisher<[Repo], Error>
    func addVisitedRepo(from repo: Repo) -> AnyPublisher<Bool, Error>
    func removeVisitedRepo(from idRepo: String) -> AnyPublisher<Bool, Error>
}

final class HomeInteractor: NSObject {
    
    typealias RepoInstance = (RemoteDataSource, LocaleDataSource) -> HomeInteractor
    
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource
    
    private init(remote: RemoteDataSource, locale: LocaleDataSource) {
        self.remote = remote
        self.locale = locale
    }
    
    static let sharedInstance: RepoInstance = { remoteRepo, localeRepo in
        return HomeInteractor(remote: remoteRepo, locale: localeRepo)
    }
}

extension HomeInteractor: HomeProvider {
    
    func searchRepos(query: String) -> AnyPublisher<[Repo], Error> {
        return self.remote.searchRepos(query: query)
            .map { RepoMapper.mapRepoResponsesToEntities(input: $0) }
            .eraseToAnyPublisher()
    }
    
    func getVisitedRepo() -> AnyPublisher<[Repo], Error> {
        return self.locale.getVisitedRepo()
            .map { RepoMapper.mapRepoObjectsToEntities(input: $0) }
            .eraseToAnyPublisher()
    }
    
    func addVisitedRepo(from repo: Repo) -> AnyPublisher<Bool, Error> {
        let repoObject = RepoMapper.mapRepoObjectToEntity(input: repo)
        return self.locale.addVisitedRepo(from: repoObject).eraseToAnyPublisher()
    }
    
    func removeVisitedRepo(from idRepo: String) -> AnyPublisher<Bool, Error> {
        return self.locale.removeVisitedRepo(from: idRepo).eraseToAnyPublisher()
    }
    
    
}

