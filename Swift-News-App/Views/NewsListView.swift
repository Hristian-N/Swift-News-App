import SwiftUI

struct NewsListView: View {
    @StateObject var viewModel = NewsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.articles) { article in
                NavigationLink(destination: NewsDetailView(article: article)) {
                    VStack(alignment: .leading) {
                        Text(article.title)
                            .font(.headline)
                        Text(article.author ?? "Unknown Author")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(article.source.name ?? "Unknown Source")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        if let date = article.publishedDate {
                            Text(date.timeAgoDisplay())
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        } else {
                            Text("Unknown Date")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Latest News")
            .onAppear {
                viewModel.fetchNews()
            }
        }
    }
}


extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
