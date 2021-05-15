//
//  FindRepoApp.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import SwiftUI

@main
struct FindRepoApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(presenter: HomePresenter(homeProvider: Injection.init().provideInteractor()))
        }
    }
}
