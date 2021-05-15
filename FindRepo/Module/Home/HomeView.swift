//
//  HomeView.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    ForEach(1..<10) { _ in
                        HomeRow()
                    }
                }
            }
            .navigationTitle("FindRepo")
            .navigationBarItems(trailing: NavigationLink(
                destination: SearchView()) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
            }.buttonStyle(PlainButtonStyle()))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
