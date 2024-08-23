//
//  Location.swift
//  difflog
//
//  Created by GTProgrammer on 2024/08/23.
//

import Foundation
import SwiftData

@Model
final class Location {
    var id: UUID
    var name: String
    
    init(id: UUID = UUID(), name: String = "") {
        self.id = id
        self.name = name
    }
}
