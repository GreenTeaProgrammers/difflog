//
//  Item.swift
//  difflog
//
//  Created by 片岩拓也 on 2024/08/22.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
