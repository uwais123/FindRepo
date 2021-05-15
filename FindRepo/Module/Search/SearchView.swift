//
//  SearchView.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var string = ""
    
    var body: some View {
        ScrollView {
            searchInput
            ForEach(1..<10) { _ in
                HomeRow()
            }
        }
    }
}

extension SearchView {
    
    var searchInput: some View {
        VStack(alignment: .leading) {
//            Text("Search")
//                .padding(.leading, 10)
//                .font(.system(size: 25, weight: .bold))
            
            HStack {
                TextField("Search some repo..", text: $string)
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
                    )
                    .padding(.horizontal, 10)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
