import Foundation

struct FriendRequest: Codable, Identifiable {
    let id = UUID().uuidString
    let fromUserId: String
    let toUserPhoneOrEmail: String
    let timestamp: Date
    var isApproved: Bool
    
    init(fromUserId: String, toUserPhoneOrEmail: String, timestamp: Date = Date(), isApproved: Bool = false) {
        self.fromUserId = fromUserId
        self.toUserPhoneOrEmail = toUserPhoneOrEmail
        self.timestamp = timestamp
        self.isApproved = isApproved
    }
}
