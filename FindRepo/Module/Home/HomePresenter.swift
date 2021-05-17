//
//  HomePresenter.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation
import Combine
import SwiftUI

class HomePresenter: ObservableObject {
    
    private let router = HomeRouter()
    private let homeProvider: HomeProvider
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var repos: [Repo] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(homeProvider: HomeProvider) {
        self.homeProvider = homeProvider
    }
    
    func getVisitedRepo() {
        homeProvider.getVisitedRepo()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    print(completion)
                }
            }, receiveValue: { repos in
                self.repos = repos
                print("saved \(repos)")
            }).store(in: &cancellables)
    }
    
    func linkToSearch<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeSearchView()
        ) { content() }
    }
    
    func linkToDetail<Content: View>(
        item repo: Repo,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeDetailView(repo: repo)
        ) { content() }
    }
    
}
