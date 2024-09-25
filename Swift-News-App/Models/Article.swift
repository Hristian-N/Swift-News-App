import Foundation

struct Article: Codable, Identifiable {
    let id = UUID()
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    
    var publishedDate: Date? {
            let dateFormatter = ISO8601DateFormatter()
            return dateFormatter.date(from: publishedAt ?? "")
        }
    
    let content: String?
}
