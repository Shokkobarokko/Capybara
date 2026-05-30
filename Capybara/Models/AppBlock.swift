import Foundation

struct AppBlock: Codable, Identifiable {
    let id = UUID()
    var appToken: String
    var appName: String
    var dailyLimitMinutes: Int
    
    init(appToken: String = "", appName: String, dailyLimitMinutes: Int = 60) {
        self.appToken = appToken
        self.appName = appName
        self.dailyLimitMinutes = dailyLimitMinutes
    }
}
