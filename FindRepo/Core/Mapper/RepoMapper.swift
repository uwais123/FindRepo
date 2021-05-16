//
//  RepoMapper.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation

final class RepoMapper {
    
    static func mapRepoResponseToEntities(
        input repoResponse: [RepoItem]
    ) -> [Repo] {
        
        return repoResponse.map { result in
            return Repo(
                id: result.id,
                fullName: result.fullName,
                name: result.name,
                description: result.description ?? "No Description",
                starGazersCount: result.starGazersCount,
                forksCount: result.forksCount,
                language: result.language,
                //owner: result.owner,
                htmlUrl: result.htmlUrl,
                detailUrl: result.cloneUrl,
                cloneUrl: result.cloneUrl
            )
        }
    }
}
