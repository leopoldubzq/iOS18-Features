import SwiftUI

struct ScrollVisibilityExample: View {
    
    @State private var colors: [Color] = [
        .red, .blue, .green,
        .yellow, .purple, .cyan,
        .brown, .black, .indigo
    ]
    
    @State private var visibleColor: Color?
    @State private var scrollOffsetY: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(colors, id: \.self) { color in
                            RoundedRectangle(cornerRadius: 12)
                                .fill(color.gradient)
                                .frame(height: 600)
                                .onScrollVisibilityChange(threshold: 0.8) { visible in
                                    if visible {
                                        visibleColor = color
                                    }
                                }
                        }
                    } header: {
                        HStack {
                            Text("Visible color:")
                            if let visibleColor {
                                Color(visibleColor)
                                    .frame(width: 35, height: 35)
                                    .clipShape(.circle)
                                    .animation(.easeInOut(duration: 0.15), value: visibleColor)
                            }
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(.background)
                    }
                    
                }
                .padding(.horizontal)
            }
            .navigationTitle("Scroll visibility")
        }
    }
}

#Preview {
    ScrollVisibilityExample()
}
