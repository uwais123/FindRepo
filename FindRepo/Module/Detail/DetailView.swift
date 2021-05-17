//
//  DetailView.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var presenter: DetailPresenter
    var repo: Repo
    
    var body: some View {
        WebView(url: URL(string: repo.htmlUrl))
            .edgesIgnoringSafeArea([.bottom, .horizontal])
            .navigationBarItems(
                trailing: Text(repo.htmlUrl)
                    .fontWeight(.medium)
            )
            .onAppear {
                presenter.addVisitedRepo(repo: repo)
            }
    }
}
