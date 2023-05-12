//  Created on 12/05/2023

import Foundation
//   let aTeam = try? JSONDecoder().decode(ATeam.self, from: jsonData)

// MARK: - ATeam
struct ATeam: Codable {
    let id: Int
    let name, shortName, tla: String
    let crest: String
    let squad: [Squad]
    let lastUpdated: Date
}

// MARK: - Squad
struct Squad: Codable {
    let id: Int
    let firstName: String
    let lastName: String?
    let name: String
    let position: Position
}

enum Position: String, Codable {
    case defence = "Defence"
    case goalkeeper = "Goalkeeper"
    case midfield = "Midfield"
    case offence = "Offence"
}

// MARK: - Encode/decode helpers

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}


// Show 1 particular team
// GET http://api.football-data.org/v4/teams/{id}
