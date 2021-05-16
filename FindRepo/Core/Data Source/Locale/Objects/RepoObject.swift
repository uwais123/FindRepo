//
//  RepoObject.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 16/05/21.
//

import Foundation
import RealmSwift

public class RepoObject: Object {
    
    @objc dynamic var id: Int64 = 0
    @objc dynamic var fullName: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var starGazersCount: Int64 = 0
    @objc dynamic var forksCount: Int64 = 0
    @objc dynamic var language: String = ""
    @objc dynamic var ownerName: String = OwnerObject().name
    @objc dynamic var htmlUrl: String = ""
    @objc dynamic var detailUrl: String = ""
    @objc dynamic var cloneUrl: String = ""
    @objc dynamic var lastUpdate: String = ""
    
    public override class func primaryKey() -> String? {
        return "id"
    }
}
