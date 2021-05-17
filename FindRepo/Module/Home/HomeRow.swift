//
//  HomeRow.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import SwiftUI

struct HomeRow: View {
    
    var repo: Repo
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.completeFormat
        return formatter
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text("\(repo.owner?.name ?? "Unknown") /")
                        .foregroundColor(.blue)
                    Text(repo.name)
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                        .padding(.leading, -5)
                    
                }
                
                Text(repo.description)
                    .padding(.top, 3)
                    .font(.system(size: 14))
                                
                HStack {
                    Text("🟡 \(repo.language)")
                        .font(.system(size: 12))
                    
                    Text(repo.lastUpdate.formatDate(), style: .date)
                        .padding(.leading, 5)
                        .font(.system(size: 12))
                    
                    Spacer()
                    
                    HStack(alignment: .center) {
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                        
                        Text(String(repo.starGazersCount.roundedWithAbbreviations))
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
