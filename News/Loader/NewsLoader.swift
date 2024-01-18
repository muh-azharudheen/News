
import Foundation

final class NewsLoader {
    var news = [Article]()
    func loadNews() async -> [Article]{
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        guard  let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2024-01-08&to=2024-01-08&sortBy=popularity&apiKey=77554f5a7c564959bd5004d5438ce35d")else{return news}
        let (data, _) = try! await URLSession.shared.data(from: url)
    
        if let jsonData = try? JSONDecoder().decode(Welcome.self, from: data){
            self.news = jsonData.articles
       
        }
        return news
            }
    
    }

