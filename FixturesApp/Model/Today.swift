//  Created on 13/05/2023

import Foundation

// MARK: - TodayMatch
struct TodayMatch: Codable {
    let matches: [Match]
    // 2 team labels, match time, 2 labels for each score, md39 label - competition code, minute - 00' label
}

// MARK: - Match
struct Match: Codable {
    let id: Int
    let utcDate: Date
    let minute: String
    let matchday: Int
    let homeTeam, awayTeam: Team1
    let score: Score
}

// MARK: - Team
struct Team1: Codable {
    let id: Int
    let name: String
}

// MARK: - FullTime
struct FullTime: Codable {
    let home, away: Int
}

// MARK: - Score
struct Score: Codable {
    let fullTime: FullTime
}
