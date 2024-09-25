import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    
    private var apiKey: String {
        return ProcessInfo.processInfo.environment["NEWS_API_KEY"] ?? "" // Add API key in Environmental Variables
    }
    
    func fetchNews() {
        let urlStr = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
        guard let url = URL(string: urlStr) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.articles = newsResponse.articles
                    }
                } catch {
                    print("Error: \(error)")
                }
            }
        }.resume()
    }
}
