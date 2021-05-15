//
//  HomeView.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    ForEach(1..<10) { _ in
                        HomeRow()
                    }
                }
            }
            .navigationTitle("Find Repo")
            .navigationBarItems(trailing: self.presenter.linkToSearch {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
            }.buttonStyle(PlainButtonStyle()))
        }
    }
}


