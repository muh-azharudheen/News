import Foundation

struct News {
    let title: String
    
    static func getNews() -> [News] {
        [
            .init(title: "A Title"),
            .init(title: "Another Title"),
            .init(title: "Yet Another Title"),
        ]
    }
}
