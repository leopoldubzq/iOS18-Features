import SwiftUI

struct MovieFetcherPreviewModifier: PreviewModifier {
    typealias Context = MovieFetcher
    
    static func makeSharedContext()  -> Context {
        MovieFetcher(type: .mock)
    }
    
    func body(content: Content, context: Context) -> some View {
        content.environment(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var movieFetcherMock: Self = .modifier(MovieFetcherPreviewModifier())
}
