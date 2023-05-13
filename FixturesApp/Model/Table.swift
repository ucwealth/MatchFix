//  Created on 12/05/2023

import Foundation

// MARK: - Table
struct LeagueListStanding: Codable {
    let standings: [Standing]
}

// MARK: - Standing
struct Standing: Codable {
    let table: [Table]
}

// MARK: - TableElement
struct Table: Codable {
    let position: Int
    let team: Team
    let won, draw, lost, points: Int
}

// MARK: - Team
struct Team: Codable {
    let id: Int
    let name, shortName: String
    let crest: String
}
