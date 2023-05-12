//  Created on 12/05/2023

import Foundation
// To parse the JSON, add this file to your project and do:
//   let competitions = try? JSONDecoder().decode(Competitions.self, from: jsonData)

// GET http://api.football-data.org/v4/competitions/

// MARK: - Competitions
struct Competitions: Codable {
    let count: Int
    let filters: Filters
    let competitions: [Competition]
}

// MARK: - Competition
struct Competition: Codable {
    let id: Int
    let name: String
//    let currentSeason: CurrentSeason
}

// MARK: - CurrentSeason
struct CurrentSeason: Codable {
    let id: Int
    let startDate, endDate: String
}

// MARK: - Filters
struct Filters: Codable {
}
