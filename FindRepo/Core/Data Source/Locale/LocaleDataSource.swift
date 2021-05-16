//
//  LocaleDataSource.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation
import RealmSwift
import Combine

protocol LocaleDataSourceProtocol: class {
    func getVisitedRepo() -> AnyPublisher<[RepoObject], Error>
    func addVisitedRepo(from repo: RepoObject) -> AnyPublisher<Bool, Error>
    func removeVisitedRepo(from idRepo: String) -> AnyPublisher<Bool, Error>
}

final class LocaleDataSource: NSObject {
    
    private let realm: Realm?
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSource = {
        realmDatabase in return LocaleDataSource(realm: realmDatabase)
    }
}

extension LocaleDataSource: LocaleDataSourceProtocol {
        
    func getVisitedRepo() -> AnyPublisher<[RepoObject], Error> {
        return Future<[RepoObject], Error> { completion in
            if let realm = self.realm {
                let repos: Results<RepoObject> = {
                    realm.objects(RepoObject.self)
                        .sorted(byKeyPath: "id", ascending: true)
                }()
                completion(.success(repos.toArray(ofType: RepoObject.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addVisitedRepo(from repo: RepoObject) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.add(repo, update: .all)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func removeVisitedRepo(from idRepo: String) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                if let repoObject = {
                    realm.objects(RepoObject.self).filter("id = \(idRepo)")
                }().first {
                    do {
                        try realm.write {
                            realm.delete(repoObject)
                            completion(.success(true))
                        }
                    } catch {
                        completion(.failure(DatabaseError.requestFailed))
                    }
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
}
