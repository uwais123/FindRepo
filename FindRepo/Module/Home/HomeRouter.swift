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
        let searchProvider = Injection.init().provideInteractor()
        let presenter = SearchPresenter(searchProvider: searchProvider)
        return SearchView(presenter: presenter)
    }
}
