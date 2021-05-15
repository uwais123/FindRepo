//
//  Injection.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation


final class Injection: NSObject {
    
    func provideInteractor() -> HomeProvider {
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        return HomeInteractor.sharedInstance(remote)
    }
}
