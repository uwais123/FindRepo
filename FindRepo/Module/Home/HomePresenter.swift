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
    
    
    func linkToSearch<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeSearchView()
        ) { content() }
    }
}
