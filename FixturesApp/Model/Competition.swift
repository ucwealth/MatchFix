//  Created on 12/05/2023

import Foundation

// MARK: - Competitions
struct CompetitionsModel: Codable {
    let count: Int
    let competitions: [Competition]
}

// MARK: - Competition
struct Competition: Codable {
    let id: Int
    let name: String
}
