import SwiftUI

struct MovieDetailView: View {
    
    var movie: Movie
    @State private var offsetY: CGFloat = .zero
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.dismiss) private var dismiss
    @State private var toolbarHidden: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                ProfileImage(offsetY: offsetY, screenSize: proxy.size)
                VStack {
                    Text("""
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae ante in lacus tincidunt posuere. Aliquam finibus libero ac leo sagittis scelerisque. Suspendisse aliquet hendrerit risus sit amet tempor. Nam iaculis ligula nec justo semper feugiat. Ut aliquet tellus vel tellus convallis condimentum. Integer justo odio, dignissim nec diam sed, bibendum fringilla ipsum. Aliquam eleifend vitae velit eget porttitor. Vestibulum vitae posuere diam. Aenean scelerisque laoreet cursus. Nulla a facilisis mauris. Morbi elit turpis, commodo eget mauris eu, posuere malesuada sem. Fusce quam nibh, aliquam eget ornare ac, vehicula in tortor. Etiam nibh dolor, eleifend sit amet metus ut, maximus porttitor quam. Sed iaculis tristique bibendum.

        In hac habitasse platea dictumst. In in sollicitudin leo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras blandit tristique sapien, eget mattis tortor. Suspendisse sed leo accumsan, condimentum metus in, faucibus lectus. Etiam dictum sapien sed rutrum dapibus. Suspendisse ut ornare augue.
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae ante in lacus tincidunt posuere. Aliquam finibus libero ac leo sagittis scelerisque. Suspendisse aliquet hendrerit risus sit amet tempor. Nam iaculis ligula nec justo semper feugiat. Ut aliquet tellus vel tellus convallis condimentum. Integer justo odio, dignissim nec diam sed, bibendum fringilla ipsum. Aliquam eleifend vitae velit eget porttitor. Vestibulum vitae posuere diam. Aenean scelerisque laoreet cursus. Nulla a facilisis mauris. Morbi elit turpis, commodo eget mauris eu, posuere malesuada sem. Fusce quam nibh, aliquam eget ornare ac, vehicula in tortor. Etiam nibh dolor, eleifend sit amet metus ut, maximus porttitor quam. Sed iaculis tristique bibendum.

            In hac habitasse platea dictumst. In in sollicitudin leo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras blandit tristique sapien, eget mattis tortor. Suspendisse sed leo accumsan, condimentum metus in, faucibus lectus. Etiam dictum sapien sed rutrum dapibus. Suspendisse ut ornare augue.
        """)
                }
                .padding(.horizontal)
                .padding(.bottom, 32)
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .onScrollGeometryChange(for: CGFloat.self) { geometry in
                geometry.contentOffset.y + geometry.contentInsets.top
            } action: { _, offsetY in
                self.offsetY = offsetY
            }
            .ignoresSafeArea(edges: .top)
            .overlay(alignment: .top) {
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left")
                    }
                    .tint(colorScheme == .light ? (offsetY > 15 ? .black : .white) : .white)
                    .fontWeight(.semibold)
                    .animation(.easeIn(duration: 0.1), value: offsetY)
                    Spacer()
                }
                .overlay {
                    Text("Movie title")
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .animation(.easeIn(duration: 0.1), value: offsetY)
                        .frame(height: 45)
                        .opacity(min(1, max(0, offsetY * 0.08)))
                }
                .padding([.horizontal, .bottom])
                .padding(.top, 8)
                .background(
                    Rectangle()
                        .fill(colorScheme == .dark ? .ultraThinMaterial : .thinMaterial)
                        .opacity(offsetY > 0 ? min(1, offsetY * 0.08) : 0.001)
                        .contentShape(Rectangle())
                        .ignoresSafeArea()
                )
            }
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    @ViewBuilder
    private func ProfileImage(offsetY: CGFloat, screenSize: CGSize) -> some View {
        GeometryReader { proxy in
            Image(movie.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: proxy.size.width,
                       height: proxy.size.height + max(0, -offsetY))
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(alignment: .top) {
                    Rectangle()
                        .fill(
                            .linearGradient(colors: [
                                Color(uiColor: .black).opacity(0.7),
                                Color(uiColor: .black).opacity(0.6),
                                Color(uiColor: .black).opacity(0.5),
                                Color(uiColor: .black).opacity(0.2),
                                Color(uiColor: .black).opacity(0.1),
                                Color(uiColor: .black).opacity(0.05),
                                Color(uiColor: .black).opacity(0.01)
                            ], startPoint: .top, endPoint: .center)
                        )
                }
                .offset(y: min(0, offsetY))
        }
        .frame(height: screenSize.height * 0.8)
        
    }
}

#Preview {
    MovieDetailView(movie: Movie(imageName: "stockImage1"))
}
