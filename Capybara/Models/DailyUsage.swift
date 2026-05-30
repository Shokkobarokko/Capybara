import Foundation

struct DailyUsage: Codable {
    
    let date: Date
    var totalMinutes: Int
    var exceededLimit: Bool
    var healthPenalty: Double
    
    init(date: Date = Date(), totalMinutes: Int = 0, exceededLimit: Bool = false, healthPenalty: Double = 0.0) {
        self.date = date
        self.totalMinutes = totalMinutes
        self.exceededLimit = exceededLimit
        self.healthPenalty = healthPenalty
    }
}
