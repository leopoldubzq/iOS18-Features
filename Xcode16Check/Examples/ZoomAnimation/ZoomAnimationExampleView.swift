import SwiftUI

struct Movie: Identifiable, Hashable {
    let id: UUID = UUID()
    let movieTitle: String = ""
    let imageName: String
}

struct ZoomAnimationExampleView: View {
    
    @State private var movies: [Movie] = [
        .init(imageName: "stockImage1"),
        .init(imageName: "stockImage2"),
        .init(imageName: "stockImage3"),
        .init(imageName: "stockImage4"),
        .init(imageName: "stockImage5"),
        .init(imageName: "stockImage6")
    ]
    @Binding var route: [Route]
    var movieDetailAnimation: Namespace.ID
    @State private var toolbarHidden: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 2)) {
                        ForEach(movies, id: \.id) { movie in
                            GeometryReader {
                                let size = $0.size
                                Image(movie.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: size.width, height: size.height)
                                    .clipShape(.rect(cornerRadius: 20))
                                    .contentShape(.rect)
                                    .onTapGesture {
                                        route.append(.imageDetail(movie))
                                    }
                            }
                            .frame(height: proxy.size.height * 0.35)
                            .matchedTransitionSource(id: movie.id, in: movieDetailAnimation) { configuration in
                                configuration
                                    .clipShape(.rect(cornerRadius: 20))
                                    .background(Color.init(uiColor: .systemBackground))
                            }
                        }
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Movies")
            
        }
    }
}

#Preview {
    @Previewable @State var route: [Route] = []
    @Previewable @Namespace var movieDetailAnimation
    NavigationStack(path: $route) {
        ZoomAnimationExampleView(route: $route, 
                                 movieDetailAnimation: movieDetailAnimation)
            .navigationDestination(for: Route.self) { destination in
                switch destination {
                case .imageDetail(let movie):
                    MovieDetailView(movie: movie)
                        .navigationTransition(
                            .zoom(
                                sourceID: movie.id,
                                in: movieDetailAnimation
                            )
                        )
                }
            }
    }
}
