//
//  RepoMapper.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation

final class RepoMapper {
    
    // MARK: -- responses -> enitites (domain model)
    static func mapRepoResponsesToEntities(
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
    
    // MARK: -- response -> enitites (domain model)
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
    
    // MARK: -- response -> enitites (domain model)
    static func mapOwnerObjectToEntity(
        input ownerObject: OwnerObject
    ) -> Owner {
        return Owner(
            id: ownerObject.id,
            name: ownerObject.name ,
            avatarUrl: ownerObject.avatarUrl ,
            profileUrl: ownerObject.profileUrl ,
            htmlUrl: ownerObject.htmlUrl
        )
    }
    
    // MARK: -- entity -> object (local)
    static func mapOwnerEntityToObject(
        input ownerEntity: Owner
    ) -> OwnerObject {
        let object = OwnerObject()
        object.id = ownerEntity.id
        object.name = ownerEntity.name
        object.avatarUrl = ownerEntity.avatarUrl
        object.profileUrl = ownerEntity.profileUrl
        object.htmlUrl = ownerEntity.htmlUrl
        return object
    }
    
    // MARK: -- responses -> enitites (domain model)
    static func mapOwnerResponsesToEntities(
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
    
    // MARK: -- object -> entity (locale model)
    static func mapRepoObjectToEntity(
        input repoEntity: Repo
    ) -> RepoObject {
        let object = RepoObject()
        object.id = repoEntity.id
        object.fullName = repoEntity.fullName
        object.name = repoEntity.name
        object.desc = repoEntity.description
        object.starGazersCount = repoEntity.starGazersCount
        object.forksCount = repoEntity.forksCount
        object.language = repoEntity.language
        object.owner = mapOwnerEntityToObject(input: repoEntity.owner ?? Owner(id: 0, name: "", avatarUrl: "", profileUrl: "", htmlUrl: ""))
        object.htmlUrl = repoEntity.htmlUrl
        object.detailUrl = repoEntity.detailUrl
        object.cloneUrl = repoEntity.cloneUrl
        object.lastUpdate = repoEntity.lastUpdate
        return object
    }
    
    // MARK: -- objects -> entities (locale model)
    static func mapRepoObjectsToEntities(
        input repoObjects: [RepoObject]
    ) -> [Repo] {
        return repoObjects.map { result in
            return Repo(
                id: result.id,
                fullName: result.fullName,
                name: result.name,
                description: result.desc,
                starGazersCount: result.starGazersCount,
                forksCount: result.forksCount,
                language: result.language,
                owner: mapOwnerObjectToEntity(input: result.owner ?? OwnerObject()),
                htmlUrl: result.htmlUrl,
                detailUrl: result.detailUrl,
                cloneUrl: result.cloneUrl,
                lastUpdate: result.lastUpdate)
        }
    }
}
