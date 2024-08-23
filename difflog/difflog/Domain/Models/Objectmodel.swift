import Foundation

struct ObjectModel: Equatable, Identifiable {
    let id: UUID
    let name: String
    let type: String
    var count: Int
    
    init(id: UUID = UUID(), name: String, type: String, count: Int) {
        self.id = id
        self.name = name
        self.type = type
        self.count = count
    }
}
