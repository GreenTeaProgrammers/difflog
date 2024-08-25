//
//  ObjectDiff.swift
//  difflog
//
//  Created by GTProgrammer on 2024/08/23.
//

import SwiftData
import Foundation

@Model
final class ObjectModel {
    var id: UUID
    var name: String
    var type: String
    var count: Int
    
    init(id: UUID = UUID(), name: String, type: String, count: Int) {
        self.id = id
        self.name = name
        self.type = type
        self.count = count
    }
}

