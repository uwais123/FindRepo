//
//  Injection.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    
    func provideInteractor() -> HomeProvider {
        let realm = try? Realm()
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
        return HomeInteractor.sharedInstance(remote, locale)
    }
}
