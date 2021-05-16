//
//  RepoResponse.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation

struct RepoResponse: Codable {
    let items: [RepoItem]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}

struct RepoItem: Codable, Identifiable {
    let id: Int64
    let fullName: String?
    let name: String?
    let description: String?
    let starGazersCount: Int64?
    let forksCount: Int64?
    let language: String?
    let owner: OwnerItem
    let htmlUrl: String?
    let detailUrl: String?
    let cloneUrl: String?
    let lastUpdate: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case name
        case description
        case starGazersCount = "stargazers_count"
        case forksCount = "forks_count"
        case language
        case owner
        case htmlUrl = "html_url"
        case detailUrl = "url"
        case cloneUrl = "clone_url"
        case lastUpdate = "updated_at"
    }
}
