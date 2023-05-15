//  Created on 12/05/2023

import Foundation
import RealmSwift

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

class CompetitionsModelRealm: Object, Codable {
    @Persisted var count: Int = 0
    var competitions = List<CompetitionRealm>()
    
    convenience init(_ comp: CompetitionsModel) {
        self.init()
        self.count = comp.count
        self.competitions.append(objectsIn: comp.competitions.map { CompetitionRealm($0) } )
    }
    
}

class CompetitionRealm: Object, Codable {
    @Persisted(primaryKey: true) var id = UUID().uuidString
    @Persisted var name: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(_ comp: Competition) {
        self.init()
        self.name = comp.name
    }
    
}
