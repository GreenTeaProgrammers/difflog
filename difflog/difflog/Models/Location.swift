

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
