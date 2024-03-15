//
//  Student.swift
//  Bookworm
//
//  Created by Mac on 15/03/2024.
//

import SwiftData
import Foundation

@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
