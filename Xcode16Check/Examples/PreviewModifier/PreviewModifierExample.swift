import SwiftUI

struct PreviewModifierExample: View {
    
    @Environment(MovieFetcher.self) private var movieFetcher
    @State private var movies: [ItemDto] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(movies) { movie in
                    Button {} label: {
                        Text(movie.title)
                    }
                    .tint(.primary)
                }
            }
            .navigationTitle("Movies")
        }
        .onAppear {
            Task {
                movies = await movieFetcher.fetchMovies()
            }
        }
    }
}

#Preview(traits: .movieFetcherMock) {
    PreviewModifierExample()
}
