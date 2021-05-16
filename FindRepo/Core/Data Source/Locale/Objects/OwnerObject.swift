//
//  OwnerObject.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 16/05/21.
//

import Foundation
import RealmSwift

public class OwnerObject: Object {
    
    @objc dynamic var id: Int64 = 0
    @objc dynamic var name: String = ""
    @objc dynamic var avatarUrl: String = ""
    @objc dynamic var profileUrl: String = ""
    @objc dynamic var htmlUrl: String = ""
    
    public override class func primaryKey() -> String? {
        return "id"
    }
}
