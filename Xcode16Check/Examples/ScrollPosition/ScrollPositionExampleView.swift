import SwiftUI

struct ScrollPositionExampleView: View {
    @State private var colors: [Color] = [
        .red, .blue, .green,
        .yellow, .purple, .cyan,
        .brown, .black, .indigo
    ]
    
    @State private var visibleColor: Color?
    @State private var isScrolling: Bool = false
    @State private var scrollPosition: ScrollPosition = .init(idType: Color.self)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(colors, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(color.gradient)
                            .frame(height: 250)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Scroll position")
            .scrollPosition($scrollPosition)
            .toolbar {
                Button("scroll") {
                    withAnimation {
                        scrollPosition.scrollTo(edge: .bottom)
                    }
                }
                .tint(.primary)
            }
        }
    }
}

#Preview {
    ScrollPositionExampleView()
}
