import SwiftUI

struct ContentView: View {
    
    @State private var route: [Route] = []
    @Namespace private var movieDetailAnimation
    
    var body: some View {
        NavigationStack(path: $route) {
            ZoomAnimationExampleView(route: $route, movieDetailAnimation: movieDetailAnimation)
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
}

#Preview {
    ContentView()
}
