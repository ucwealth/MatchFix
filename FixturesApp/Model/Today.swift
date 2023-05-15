//  Created on 13/05/2023

import Foundation

// MARK: - Today
struct TodayMatch: Codable {
    let filters: Filters
    let matches: [Match]
}

// MARK: - Filters
struct Filters: Codable {
    let dateFrom, dateTo: String
    let permission: String?
}

// MARK: - Match
struct Match: Codable {
    let id: Int
    let utcDate: String
    let status: String
    let matchday: Int
    let homeTeam: HomeTeam
    let awayTeam: AwayTeam
    let score: Score
}

// MARK: - Score
struct Score: Codable {
    let fullTime: Time
}

struct HomeTeam: Codable {
    let id: Int
    let name: String
}

struct AwayTeam: Codable {
    let id: Int
    let name: String
}

// MARK: - Time
struct Time: Codable {
    let home, away: Int?
}

