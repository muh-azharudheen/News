
import Foundation

final class NewsLoader {
    func loadNews() async -> [News] {
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        return News.getNews()
    }
}
