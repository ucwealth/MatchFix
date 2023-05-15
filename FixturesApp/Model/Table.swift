//  Created on 12/05/2023

import Foundation
import RealmSwift

// MARK: - LeagueTable
struct LeagueTableModel: Codable {
    let standings: [Standing]
}

// MARK: - Standing
struct Standing: Codable {
    let table: [Table]
}

// MARK: - Table
struct Table: Codable {
    let position: Int
    let team: Team
    let won, draw, lost: Int
}

// MARK: - Team
struct Team: Codable {
    let id: Int
    let name: String
    let crest: String
}


//class LeagueTableModelRealm: Object {
//    @Persisted(primaryKey: true) var id = UUID().uuidString
//    var standings = List<StandingRealm>()
//   // @Persisted var standings: [StandingRealm] = []
//
//    override static func primaryKey() -> String? {
//        return "id"
//    }
//
//    convenience init(_ leagueTableModel: LeagueTableModel) {
//        self.init()
//        self.standings.append(objectsIn: leagueTableModel.standings.map { StandingRealm($0) })
//    }
//}
//
//class StandingRealm: Object, ObjectKeyIdentifiable {
//    @Persisted(primaryKey: true) var id = UUID().uuidString
//    var table = List<TableRealm>()
//
//    override static func primaryKey() -> String? {
//        return "id"
//    }
//
//    convenience init(_ standing: Standing) {
//        self.init()
//       // self.table = standing.table.map { TableRealm($0) }
//    }
//}

//class TableRealm: Object {
//    @Persisted var position: Int = 0
//    @Persisted var team: TeamRealm?
//    @Persisted var won: Int = 0
//    @Persisted var draw: Int = 0
//    @Persisted var lost: Int = 0
//    @Persisted var points: Int = 0
//
//    convenience init(_ table: Table) {
//        self.init()
//        self.position = table.position
//        self.team = TeamRealm(table.team)
//        self.won = table.won
//        self.draw = table.draw
//        self.lost = table.lost
//    }
//}
//
//class TeamRealm: Object {
//    @Persisted(primaryKey: true) var id: Int = 0
//    @Persisted var name: String = ""
//    @Persisted var crest: String = ""
//
//    convenience init(_ team: Team) {
//        self.init()
//        self.id = team.id
//        self.name = team.name
//        self.crest = team.crest
//    }
//}
