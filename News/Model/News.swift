import Foundation

struct News {
    let title: String
    let description: String
    
    static func getNews() -> [News] {
        [
            .init(title: "A Title", description: "A description"),
            .init(title: "Another Title", description: "Another Description"),
            .init(title: "Yet Another Title", description: "Yet Another Description"),
        ]
    }
}
