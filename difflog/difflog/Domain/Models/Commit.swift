import Foundation

struct Commit: Equatable, Identifiable {
    let id: UUID
    let timestamp: Date
    let diff: Diff
    let location: Location
    
    init(id: UUID = UUID(), timestamp: Date = Date(), diff: Diff, location: Location) {
        self.id = id
        self.timestamp = timestamp
        self.diff = diff
        self.location = location
    }
}

