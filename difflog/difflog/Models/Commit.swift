//
//  Commit.swift
//  difflog
//
//  Created by GTProgrammer on 2024/08/23.
//

import Foundation
import SwiftData

@Model
final class Commit {
    var id: UUID
    var timestamp: Date
    @Relationship(deleteRule: .cascade) var diff: Diff?
    @Relationship(deleteRule: .cascade) var location: Location
    
    init(id: UUID = UUID(), timestamp: Date = Date(), diff: Diff? = nil, location: Location? = nil) {
        self.id = id
        self.timestamp = timestamp
        self.diff = diff
        self.location = location ?? Location()
    }
}
