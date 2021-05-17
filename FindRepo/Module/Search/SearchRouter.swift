//
//  SearchRoutefr.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 17/05/21.
//

import Foundation
import SwiftUI

class SearchRouter {
    
    func makeDetailView(repo: Repo) -> some View {
        let provider = Injection.init().provideInteractor()
        let presenter = DetailPresenter(provider: provider)
        return DetailView(presenter: presenter, repo: repo)
    }
}
