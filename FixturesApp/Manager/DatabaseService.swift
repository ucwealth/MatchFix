//  Created on 14/05/2023

import Foundation
import RealmSwift

class DatabaseService {
    
    private let realm: Realm
    
    init() {
        do {
            self.realm = try Realm()
        } catch {
            fatalError("Failed to instantiate Realm. Error: \(error)")
        }
    }
    
    // MARK: - CREATE
    func create<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print("Error creating object: \(error.localizedDescription)")
        }
    }
    
    // MARK: - UPDATE
    func update<T: Object>(_ object: T, with dictionary: [String: Any?]) {
        do {
            try realm.write {
                for (key, value) in dictionary {
                    if let value = value {
                        object.setValue(value, forKey: key)
                    }
                }
            }
        } catch {
            print("Error updating object: \(error.localizedDescription)")
        }
    }
    
    // MARK: - DELETE
    func delete<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print("Error deleting object: \(error.localizedDescription)")
        }
    }
    
    // MARK: - READ
    func fetch<T: Object>(_ type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
    
    // MARK: - OBSERVE
    func observe<T: Object>(_ type: T.Type, completion: @escaping (Results<T>) -> Void) -> NotificationToken {
        let results = realm.objects(type)
        let token = results.observe { (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                completion(results)
            case .update(_, let deletions, let insertions, let modifications):
                completion(results)
            case .error(let error):
                fatalError("Failed to observe Realm results. Error: \(error)")
            }
        }
        return token
    }
    
    func dropDB() {
        // Get the default Realm file URL
        let realmFileURL = Realm.Configuration.defaultConfiguration.fileURL!

        // Delete the Realm file if it exists
        if FileManager.default.fileExists(atPath: realmFileURL.path) {
            do {
                try FileManager.default.removeItem(at: realmFileURL)
                print("Realm file deleted successfully")
            } catch {
                print("Error deleting Realm file: \(error)")
            }
        } else {
            print("Realm file does not exist")
        }
    }
    
}
