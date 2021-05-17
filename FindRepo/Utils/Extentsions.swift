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

extension Int64 {
    var roundedWithAbbreviations: String {
        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1000000
        if million >= 1.0 {
            return "\(round(million*10)/10)M"
        }
        else if thousand >= 1.0 {
            return "\(round(thousand*10)/10)K"
        }
        else {
            return "\(self)"
        }
    }
}

