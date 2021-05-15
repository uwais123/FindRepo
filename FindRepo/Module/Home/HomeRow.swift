//
//  HomeRow.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import SwiftUI

struct HomeRow: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Uwais123 /")
                        .foregroundColor(.blue)
                    Text("MovieCatalogue")
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                        .padding(.leading, -5)
                    
                }
                
                Text("MovieDB iOS Client App (Programmatic UIKit, MVVM, Clean Architecture, Realm, Alamofire, RxSwift, Manual DI)")
                    .padding(.top, 3)
                    .font(.system(size: 14))
                
                HStack {
                    Text("🟡 Swift")
                        .font(.system(size: 12))
                    
                    Text("Updated 8 days ago")
                        .padding(.leading, 5)
                        .font(.system(size: 12))
                    
                    Spacer()
                    
                    HStack(alignment: .center) {
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                        
                        Text("3k")
                            .padding(.leading, -5)
                            .font(.system(size: 12))
                    }
                    
                }.padding(.top, 8)
            }.padding()
            
            Spacer()
        }.background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 2)
        )
        .padding(.horizontal, 10)
        .padding(.top, 5)
    }
}

struct HomeRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeRow().previewLayout(.sizeThatFits)
    }
}
