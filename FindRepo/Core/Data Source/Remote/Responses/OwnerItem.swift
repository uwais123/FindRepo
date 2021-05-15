//
//  OwnerItem.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation


struct OwnerItem: Codable, Identifiable {
    let id: String
    let name: String
    let avatarUrl: String
    let profileUrl: String
    let htmlUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatarUrl = "avatar_url"
        case profileUrl = "url"
        case htmlUrl = "html_url"
    }
}
