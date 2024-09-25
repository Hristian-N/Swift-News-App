import SwiftUI

struct NewsDetailView: View {
    let article: Article

    var body: some View {
        VStack {
            
            Text(article.title)
                .font(.title)
                .padding()
            
            if let urlToImage = article.urlToImage, let imageUrl = URL(string: urlToImage) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                }
                .frame(height: 200)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.gray)
                    .frame(height: 200)
            }
            
            Spacer()

            Button(action: {
                if let url = URL(string: article.url) {
                    UIApplication.shared.open(url)
                }
            }) {
                Text("Read Full Article")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                    )
            }
            .padding()
        }
        .navigationTitle(article.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
