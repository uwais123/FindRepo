//
//  Constants.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation


struct Constants {
    
    static let baseUrl = "https://api.github.com/"
    static let placeHolder = "https://www.btklsby.go.id/images/placeholder/basic.png"
    static let completeFormat = "EEEE, dd MMMM yyyy"
    static let basicFormat = "dd/MM/yy"
}


protocol Endpoint {
    var url: String { get }
}

enum Endpoints {
    
    enum Gets: Endpoint {
        case search
        
        public var url: String {
            switch self {
            case .search: return "\(Constants.baseUrl)search/repositories?q="
            }
        }
    }
    
}
