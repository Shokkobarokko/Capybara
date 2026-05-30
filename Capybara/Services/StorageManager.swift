import Foundation

final class StorageManager {
    
    //MARK: - Singleton
    static let shared = StorageManager()
    private init() {}
    
    private enum Keys {
        static let currentUser = "currentUser"
    }
    
    //MARK: - Save & Load User
    func saveUser(_ user: User) {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(user)
            UserDefaults.standard.set(data, forKey: Keys.currentUser)
            print("Пользователь сохранен")
        } catch {
            print("Ошибка сохранения \(error)")
        }
    }
    
    func loadUser() -> User? {
        guard let data = UserDefaults.standard.data(forKey: Keys.currentUser) else {
            print("Пользователь не найден")
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let user = try decoder.decode(User.self, from: data)
            print("Пользователь загружен \(user.name)")
            return user
        } catch {
            print("Ошибка загрузки \(error)")
            return nil
        }
    }
    
    func clearAllData() {
        UserDefaults.standard.removeObject(forKey: Keys.currentUser)
        print("Все данные удалены")
    }
}
