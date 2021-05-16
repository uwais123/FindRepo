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
                fullName: result.fullName ?? "Unknown",
                name: result.name ?? "Unknown",
                description: result.description ?? "No Description",
                starGazersCount: result.starGazersCount ?? 0,
                forksCount: result.forksCount ?? 0,
                language: result.language ?? "Unknown",
                owner: mapOwnerResponseToEntities(input: result.owner),
                htmlUrl: result.htmlUrl ?? "Unknown",
                detailUrl: result.detailUrl ?? "Unknown",
                cloneUrl: result.cloneUrl ?? "Unknown",
                lastUpdate: result.lastUpdate ?? "Unknown"
            )
        }
    }
    
    static func mapOwnerResponseToEntities(
        input ownerItem: OwnerItem
    ) -> Owner {
        
        return Owner(
            id: ownerItem.id,
            name: ownerItem.name ?? "Unknown",
            avatarUrl: ownerItem.avatarUrl ?? "Unknown",
            profileUrl: ownerItem.profileUrl ?? "Unknown",
            htmlUrl: ownerItem.htmlUrl ?? "Unknown"
        )
    }
    
    static func mapOwnerResponseToEntities(
        input ownerResponse: [OwnerItem]
    ) -> [Owner] {
        
        return ownerResponse.map { result in
            return Owner(
                id: result.id,
                name: result.name ?? "Unknown",
                avatarUrl: result.avatarUrl ?? "Unknown",
                profileUrl: result.profileUrl ?? "Unknown",
                htmlUrl: result.htmlUrl ?? "Unknown"
            )
        }
    }
}
