import Foundation

struct Diff: Equatable {
    let addedObjects: [ObjectModel]
    let removedObjects: [ObjectModel]
    let modifiedObjects: [ObjectDiff]
    
    init(addedObjects: [ObjectModel] = [],
         removedObjects: [ObjectModel] = [],
         modifiedObjects: [ObjectDiff] = []) {
        self.addedObjects = addedObjects
        self.removedObjects = removedObjects
        self.modifiedObjects = modifiedObjects
    }
}

struct ObjectDiff: Equatable {
    let object: ObjectModel
    let previousCount: Int
    let newCount: Int
    
    init(object: ObjectModel, previousCount: Int, newCount: Int) {
        self.object = object
        self.previousCount = previousCount
        self.newCount = newCount
    }
}
