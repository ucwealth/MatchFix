//  Created on 13/05/2023

import Foundation
// https://api.football-data.org/v4/matches

// MARK: - TodayMatch
struct TodayMatch: Codable {
    let filters: Filters1
    let resultSet: ResultSet
    let matches: [Match]
    // 2 team labels, match time, 2 labels for each score, md39 label - competition code, minute - 00' label
}

// MARK: - Filters
struct Filters1: Codable {
    let dateFrom, dateTo, permission: String
}

// MARK: - Match
struct Match: Codable {
    let season: Season
    let id: Int
    let utcDate: Date
    let status, minute: String
    let matchday: Int
    let lastUpdated: Date
    let homeTeam, awayTeam: Team1
    let score: Score
}

// MARK: - Team
struct Team1: Codable {
    let id: Int
    let name, tla: String
}

// MARK: - FullTime
struct FullTime: Codable {
    let home, away: Int
}

// MARK: - Score
struct Score: Codable {
    let winner, duration: String
    let fullTime, halfTime: FullTime
}

// MARK: - Season
struct Season: Codable {
    let id: Int
    let startDate, endDate: String
    let currentMatchday: Int
    let stages: [String]
}

// MARK: - ResultSet
struct ResultSet: Codable {
    let count: Int
    let competitions, first, last: String
    let played: Int
}
