import Foundation

protocol StorageManagerProtocol {
    func set(_ object: Any?, forKey key: StorageManager.Keys)

    func getInt(forKey key: StorageManager.Keys) -> Int?
    func getString(forKey key: StorageManager.Keys) -> String?
    func getArray(forKey key: StorageManager.Keys) -> [Int]?
    func getBool(forKey key: StorageManager.Keys) -> Bool?
}

final class StorageManager {
    public enum Keys: String {
        case gameTimeSwitch
        case duration
        case selectedCellIndex
        case crossImageName
        case noughtImageName
        case leaderboard
        case musicOn
        case gameMode
    }

    private let userDefaults = UserDefaults.standard

    private func store(_ object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }

    private func restore(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
}

// MARK: - StorageManagerProtocol
extension StorageManager: StorageManagerProtocol {
    func set(_ object: Any?, forKey key: Keys) {
        if key == .leaderboard {
            guard let intValue = object as? Int else {
                print("Error: Object is not an integer and cannot be added to the array leaderboard.\(String(describing: object))")
                return
            }
            var array = getArray(forKey: key) ?? []
            array.append(intValue)
            store(array, key: key.rawValue)
        } else {
            store(object, key: key.rawValue)
        }
    }
    
    func getInt(forKey key: Keys) -> Int? {
        restore(forKey: key.rawValue) as? Int
    }

    func getString(forKey key: Keys) -> String? {
        restore(forKey: key.rawValue) as? String
    }

    func getArray(forKey key: Keys) -> [Int]? {
        return restore(forKey: key.rawValue) as? [Int]
    }
    
    func getSelectedCellIndex(forKey key: Keys) -> Int? {
        return restore(forKey: key.rawValue) as? Int
    }

    func getBool(forKey key: Keys) -> Bool? {
        restore(forKey: key.rawValue) as? Bool
    }
    
    func remove(forKey key: Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}

