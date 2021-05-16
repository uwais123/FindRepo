//
//  DetailView.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import SwiftUI

struct DetailView: View {
    
    var htmlUrl: String
    
    var body: some View {
        WebView(url: URL(string: htmlUrl))
            .edgesIgnoringSafeArea([.bottom, .horizontal])
            .navigationBarItems(
                trailing: Text(htmlUrl)
                    .fontWeight(.medium)
            )
            .onAppear {
                
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(htmlUrl: "https://github.com/apple/swift")
    }
}
