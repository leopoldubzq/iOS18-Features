import SwiftUI

struct ScrollPhaseChangeExampleView: View {
    @State private var colors: [Color] = [
        .red, .blue, .green,
        .yellow, .purple, .cyan,
        .brown, .black, .indigo,
        .red, .blue, .green,
        .yellow, .purple, .cyan,
        .brown, .black, .indigo
    ]
    
    @State private var visibleColor: Color?
    @State private var isScrolling: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(colors, id: \.self) { color in
                            RoundedRectangle(cornerRadius: 12)
                                .fill(color.gradient)
                                .frame(height: 250)
                        }
                    } header: {
                        Group {
                            Text("Is scrolling: ") +
                            Text("\(isScrolling ? "true" : "false")")
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                        .background(.background)
                    }
                    
                }
                .padding(.horizontal)
            }
            .navigationTitle("Scroll phase change")
            .onScrollPhaseChange { _, phase in
                isScrolling = phase.isScrolling
            }
        }
    }
}

#Preview {
    ScrollPhaseChangeExampleView()
}
