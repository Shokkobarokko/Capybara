import Foundation

final class ScreenTimeManager {

    static let shared = ScreenTimeManager()

    private init() {}

    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        // TODO: Integrate with real Screen Time authorization flow when available.
        DispatchQueue.main.async {
            completion(true)
        }
    }
}
