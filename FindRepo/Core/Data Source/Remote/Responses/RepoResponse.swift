//
//  RepoResponse.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation

struct RepoResponse: Codable {
    let repos: [RepoItem]
    
    enum CodingKeys: String, CodingKey {
        case repos = "items"
    }
}

struct RepoItem: Hashable, Codable, Identifiable {
    let id: String
    let fullName: String
    let name: String
    let description: String?
    let starGazersCount: String
    let forksCount: String
    let language: String
    //let owner: OwnerItem
    let htmlUrl: String
    let detailUrl: String
    let cloneUrl: String
    let lastUpdate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case name
        case description
        case starGazersCount = "stargazers_count"
        case forksCount = "forks_count"
        case language
        //case owner
        case htmlUrl = "html_url"
        case detailUrl = "url"
        case cloneUrl = "clone_url"
        case lastUpdate = "updated_at"
    }
}
