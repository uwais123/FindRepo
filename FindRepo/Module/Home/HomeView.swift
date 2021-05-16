//
//  HomeView.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    
    // MARK: -- implement lottie animation
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    ForEach(presenter.repos) { item in
                        HomeRow(repo: item)
                    }
                }
            }
            .onAppear {
                presenter.getVisitedRepo()
            }
            .navigationTitle("Visited Repo")
            .navigationBarItems(trailing: self.presenter.linkToSearch {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
            }.buttonStyle(PlainButtonStyle()))
        }
    }
}


