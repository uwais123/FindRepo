//
//  RemoteDataSource.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation
import Combine
import Alamofire

protocol RemoteDataProtocol {
    func searchRepos(query: String) -> AnyPublisher<[RepoItem], Error>
}

final class RemoteDataSource: NSObject {
    override init() {}
    
    static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataProtocol {
    func searchRepos(query: String) -> AnyPublisher<[RepoItem], Error> {
        return Future<[RepoItem], Error> { completion in
            if let url = URL(string: Endpoints.Gets.search.url + query) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: RepoResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value.repos))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
}
