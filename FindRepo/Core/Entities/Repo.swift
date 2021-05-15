//
//  Repo.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation

struct Repo: Codable, Identifiable {
    let id: String
    let fullName: String
    let name: String
    let description: String
    let starGazersCount: String
    let forksCount: String
    let language: String
    //let owner: Owner
    let htmlUrl: String
    let detailUrl: String
    let cloneUrl: String
}
