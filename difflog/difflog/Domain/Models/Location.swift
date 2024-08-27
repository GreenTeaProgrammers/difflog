import Foundation
import SwiftData

@Model
struct Location {
    @Attribute(.unique) var id: UUID
    var name: String
    var nowSelected: Bool

    init(id: UUID = UUID(), name: String, nowSelected: Bool = false) {
        self.id = id
        self.name = name
        self.nowSelected = nowSelected
    }
}
