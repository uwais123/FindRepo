//
//  DetailPresenter.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 16/05/21.
//

import Foundation
import Combine

class DetailPresenter: ObservableObject {
    
    private let provider: HomeProvider
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(provider: HomeProvider) {
        self.provider = provider
    }
    
    func addVisitedRepo(repo: Repo) {
        provider.addVisitedRepo(from: repo)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                    print(self.errorMessage)
                case .finished:
                    print(completion)
                }
            }, receiveValue: { isSaved in
                print("isSaved \(isSaved)")
            }).store(in: &cancellables)
    }
}
