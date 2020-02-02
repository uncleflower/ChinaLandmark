import Foundation

struct User {
    var username: String
    var prefersNotifications = true
    var prefersSeason = Season.winter
    var birthday = Date()
    
    //Self代表着User，Self只能在静态属性中运用，因为静态属性不依赖User的实例化
    static let `default` = Self(username: "jiehaoZhang")
    
    enum Season: String, CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
}

//单例模式
//User.default


