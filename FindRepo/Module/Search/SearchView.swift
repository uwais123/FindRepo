//
//  SearchView.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var presenter: SearchPresenter
    @State var string = ""
    
    var body: some View {
        ScrollView {
            searchInput
            if presenter.loadingState {
                ActivityIndicator()
                    .padding(.top, 15)
            } else {
                ForEach(presenter.searchResults) { item in
                    presenter.linkToDetail(item: item) {
                        HomeRow(repo: item)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

extension SearchView {
    
    var searchInput: some View {
        VStack(alignment: .leading) {
            
            HStack {
                TextField("Search some repo..", text: $presenter.searchText)
                    .font(.system(size: 15))
                    .padding(.horizontal, 15)
                    .frame(height: 40)
                    .background(
                        ZStack(alignment: .trailing) {
                            RoundedRectangle(cornerRadius: 7)
                                .fill(Color(.systemGray6))
                            
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(.systemGray2))
                                .padding(.trailing, 13)
                        }
                    ).padding(.horizontal, 10)
            }
        }
    }
}
