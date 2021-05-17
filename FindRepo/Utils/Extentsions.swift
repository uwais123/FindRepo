//
//  Extentsions.swift
//  FindRepo
//
//  Created by Uwais Alqadri on 15/05/21.
//

import Foundation
import RealmSwift


extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
}

extension String {
    // MARK: -- need to convert string to date
    func formatDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.completeFormat
        return dateFormatter.date(from: self) ?? Date()
    }
}

