import UIKit

struct CapybaraState: Codable {
    
    var health: Double
    var lastHealthUpdate: Date
    var name: String
    var imageData: Data?
    
    init(health: Double = 1.0, lastHealthUpdate: Date = Date(), name: String = "Бара", imageData: Data? = nil) {
        self.health = min(max(health, 0.0), 1.0)
        self.lastHealthUpdate = lastHealthUpdate
        self.name = name
        self.imageData = imageData
    }
}
