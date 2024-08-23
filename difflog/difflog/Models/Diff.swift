//
//  Diff.swift
//  difflog
//
//  Created by GTProgrammer on 2024/08/23.
//

import SwiftData
import Foundation

@Model
final class Diff {
    @Relationship(deleteRule: .cascade) var addedObjects: [ObjectModel]
    @Relationship(deleteRule: .cascade) var removedObjects: [ObjectModel]
    @Relationship(deleteRule: .cascade) var modifiedObjects: [ObjectDiff]
    
    init(addedObjects: [ObjectModel] = [],
         removedObjects: [ObjectModel] = [],
         modifiedObjects: [ObjectDiff] = []) {
        self.addedObjects = addedObjects
        self.removedObjects = removedObjects
        self.modifiedObjects = modifiedObjects
    }
}

@Model
final class ObjectDiff {
    @Relationship(deleteRule: .cascade) var object: ObjectModel
    var previousCount: Int
    var newCount: Int
    
    init(object: ObjectModel, previousCount: Int, newCount: Int) {
        self.object = object
        self.previousCount = previousCount
        self.newCount = newCount
    }
}
