//
//  SearchPresenter.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation
import Combine
import SwiftUI

class SearchPresenter: ObservableObject {
    
    private let provider: HomeProvider
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var searchResults: [Repo] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    @Published var searchText: String = String()
    
    init(provider: HomeProvider) {
        self.provider = provider
        
        $searchText
            .debounce(for: .milliseconds(800), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { string in
                if string.count < 1 {
                    self.searchResults = []
                    return nil
                }
                return string
            }
            .compactMap { $0 }
            .sink { (_) in
                
            } receiveValue: { searchField in
                self.searchRepos(query: searchField)
                
            }.store(in: &cancellables)
    }
    
    func searchRepos(query: String) {
        self.loadingState = true
        provider.searchRepos(query: query)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                    print(self.errorMessage)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { searchResults in
                if searchResults.isEmpty {
                    self.errorMessage = "No Results"
                    print(self.errorMessage)
                } else {
                    self.searchResults = searchResults
                    print(searchResults)
                }
            }).store(in: &cancellables)
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
    
    func removeVisitedRepo(idRepo: String) {
        provider.removeVisitedRepo(from: idRepo)
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
                print(isSaved)
            }).store(in: &cancellables)
    }
}
