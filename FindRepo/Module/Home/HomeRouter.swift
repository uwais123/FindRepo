//
//  HomeRouter.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation
import SwiftUI

class HomeRouter {
    
    func makeSearchView() -> some View {
        let provider = Injection.init().provideInteractor()
        let presenter = SearchPresenter(provider: provider)
        return SearchView(presenter: presenter)
    }
}
