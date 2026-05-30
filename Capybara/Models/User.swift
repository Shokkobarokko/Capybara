import Foundation

struct User: Codable {
    let id: String
    var name: String
    var capybara: CapybaraState
    var blockedApps: [AppBlock]
    var usageHistory:[DailyUsage]
    var friends: [String]
    
    init(id: String = UUID().uuidString, name: String = "Игрок", capybara: CapybaraState = CapybaraState(), blockedApps: [AppBlock] = [], usageHistory: [DailyUsage] = [], friends: [String] = []) {
        self.id = id
        self.name = name
        self.capybara = capybara
        self.blockedApps = blockedApps
        self.usageHistory = usageHistory
        self.friends = friends
    }
}
