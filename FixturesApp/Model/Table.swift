//  Created on 12/05/2023

import Foundation
// To parse the JSON, add this file to your project and do:
//   let table = try? JSONDecoder().decode(Table.self, from: jsonData)

// GET http://api.football-data.org/v4/competitions/PL/standings

// MARK: - Table
struct Standings: Codable {
    let filters: Filters2
    let standings: [Standing]
}


// MARK: - Filters
struct Filters2: Codable {
    let season: String
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

